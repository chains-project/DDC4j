import copy
import os
import pickle
import re
from pathlib import Path as PathlibPath

class Path:
    def __init__(self, path: str, path_part: str | None, log_line: str | None, enoenf_bool: bool):
        self.path = path
        self.path_part = path_part
        self.log_lines = [log_line]
        self.children = {}
        self.count = 1
        self.enoenf_bool = enoenf_bool
    
    def hit(self, log_line: str):
        self.log_lines.append(log_line)
        self.count += 1

    def recursive_print(self, depth: int = 0, max_depth: int = 5, i: int = 0, max_i: int = 1000) -> int:
        if depth > max_depth:
            return i
        if i > max_i:
            return i
        print('  ' * depth, self)
        for child in self.children:
            i += 1
            i = self.children[child].recursive_print(depth + 1, max_depth, i, max_i)
        return i

    def __getitem__(self, key: str):
        return self.children[key]
    
    def __setitem__(self, key: str, value):
        self.children[key] = value

    def __contains__(self, key: str):
        return key in self.children
    
    def __str__(self):
        return f"{self.path_part}: {self.count}" + (" (ENOENF)" if self.enoenf_bool else "")
    
    def __repr__(self):
        return f"{self.path_part}: {self.count}" + (" (ENOENF)" if self.enoenf_bool else "")
    
    def __iter__(self):
        return iter(self.children)

def load(strace_log_path) -> dict:
    print("Path used:\n  ", strace_log_path)

    root_directory = Path('/', None, None, False)
    no_path_lines = []
    problematic = []

    with open(strace_log_path, 'r') as f:
        i = 0
        for line in f:
            i += 1
            if i % 100_000 == 0: print(f"Scanning line {i}...")
            matches = re.findall(r'".*?"', line)
            if len(matches) == 0:
                # print("No path found on line:", line)
                no_path_lines.append(f"LINE {i}: "+line)
                continue

            enoenf_bool = len(re.findall(r'ENOENF', line)) > 0

            for path in matches:
                path = path[1:-1]
                path = clean_path(path, problematic)
                if path == -1:
                    continue
                register_path(root_directory, path, line, enoenf_bool)
    
    return root_directory, problematic, no_path_lines

def clean_path(path: str, problematic: list[str]) -> str:
    path_parts = []
    for part in path.split('/')[1:]:
        if part == '..':
            if path_parts:
                path_parts.pop()
            else:
                problematic.append(path)
                return -1
        elif part == '.':
            pass
        else:
            path_parts.append(part)
    return '/' + '/'.join(path_parts)

def register_path(root_directory: Path, path: list[str], log_line: str, enoenf_bool: bool):
    curr_path = '/'
    path_parts: list[str] = path.split('/')[1:] # [1:] to skip the first empty string
    current_directory = root_directory
    for part in path_parts:
        curr_path += part
        if curr_path not in current_directory:
            current_directory[curr_path] = Path(curr_path, part, log_line, enoenf_bool)
        else:
            current_directory[curr_path].hit(log_line)

        current_directory = current_directory[curr_path]
        curr_path += '/'

def load_pickle(file_path: str) -> dict:
    return pickle.load(open(file_path, "rb"))

def init():
    try:
        root_directory = load_pickle("root_directory.pkl")
        print("Root directory loaded from root_directory.pkl")
        problematic = load_pickle("problematic.pkl")
        print("Problematic paths loaded from problematic.pkl")
        no_path_lines = load_pickle("no_path_lines.pkl")
        print("Lines with no path loaded from no_path_lines.pkl")
    except FileNotFoundError:
        print("Some Pickle not found, reloading strace log...")
        root_directory, problematic, no_path_lines = load("./strace_analysis/strace.log")
        pickle.dump(root_directory, open("root_directory.pkl", "wb"))
        print("Root directory saved to root_directory.pkl")
        pickle.dump(problematic, open("problematic.pkl", "wb"))
        print("Problematic paths saved to problematic.pkl")
        pickle.dump(no_path_lines, open("no_path_lines.pkl", "wb"))
        print("Lines with no path saved to no_path_lines.pkl")
    return root_directory, problematic, no_path_lines

if __name__ == "__main__":
    root_directory, problematic, no_path_lines = init()
    root_directory.recursive_print(max_depth=3, max_i=1000)
    for i in range(100):
        print(problematic[i])
    for i in range(100):
        print(no_path_lines[i])