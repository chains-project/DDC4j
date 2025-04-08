# Written with help from GPT

import sys
import re

def extract_dependencies(input_path, output_path):
    with open(input_path, 'r') as f:
        lines = [line.strip() for line in f if line.strip()]

    label_pattern = re.compile(r'"(\d+)".*label.*"([^"]+)"')
    keyword_pattern = re.compile(r'icedtea|jdk|ecj|classpath|jamvm|ant-bootstrap', re.IGNORECASE)

    nodes: dict = {}

    for line in lines:
        if '->' in line:
            pass
        elif 'label' in line:
            m = label_pattern.match(line) # m[1], label = m[2]
            if m:
                nodes.update({line: (m[1], m[2])})
        else:
            print("Ignoring line:", line)

    dependency_lines = [nodes[n][1] for n in nodes if not keyword_pattern.search(nodes[n][1])]

    with open(output_path, 'w') as f:
        f.write('\n'.join(dependency_lines).replace("@","-") + '\n')

if __name__ == "__main__":
    if len(sys.argv) != 3:
        print("Usage: python extract_dependencies_from_pruned.py input.dot output")
        sys.exit(1)

    extract_dependencies(sys.argv[1], sys.argv[2])
