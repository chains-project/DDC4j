# Written with help from GPT

import sys
import re

def prune_dot_file(input_path, output_path):
    with open(input_path, 'r') as f:
        lines = [line.strip() for line in f if line.strip()]

    label_pattern = re.compile(r'"(\d+)".*label.*"([^"]+)"')
    edge_pattern = re.compile(r'"(\d+)".*->.*"(\d+)"')
    keyword_pattern = re.compile(r'icedtea|jdk|ecj|classpath|jamvm|ant-bootstrap', re.IGNORECASE)

    nodes: dict = {}
    edges: dict = {}

    for line in lines:
        if '->' in line:
            m = edge_pattern.match(line) # m[1] -> m[2]
            if m:
                edges.update({line: (m[1], m[2])})
        elif 'label' in line:
            m = label_pattern.match(line) # m[1], label = m[2]
            if m:
                nodes.update({line: (m[1], m[2])})
        else:
            print("Ignoring line:", line)

    target_node_lines = [n for n in nodes if keyword_pattern.search(nodes[n][1])]
    target_node_ids = [nodes[line][0] for line in target_node_lines]
    d1_edge_lines = [e for e in edges if edges[e][0] in target_node_ids]
    d1_edge_target_ids = [edges[e][1] for e in d1_edge_lines]
    d1_child_lines = [n for n in nodes if nodes[n][0] in d1_edge_target_ids]

    result = set(target_node_lines) | set(d1_edge_lines) | set(d1_child_lines)

    with open(output_path, 'w') as f:
        f.write('digraph G {\n  ')
        f.write('\n  '.join(result) + '\n')
        f.write('}\n')

if __name__ == "__main__":
    if len(sys.argv) != 3:
        print("Usage: python prune_dot.py input.dot output.dot")
        sys.exit(1)

    prune_dot_file(sys.argv[1], sys.argv[2])
