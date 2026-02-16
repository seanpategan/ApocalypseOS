# ApocalypseOS — Offline Coding Guides

Welcome to the ApocalypseOS development documentation. Everything here works fully offline.

## Guides

1. [Getting Started with Python](getting-started-python.md)
   Learn Python from scratch — variables, functions, files, and building projects.

2. [Getting Started with C](getting-started-c.md)
   Systems programming with C — compilation, pointers, memory, and Makefiles.

3. [Getting Started with JavaScript](getting-started-javascript.md)
   JavaScript and Node.js — scripting, web basics, and building tools.

4. [Using Local AI for Coding](using-local-ai.md)
   How to use Ollama models as your offline coding assistant.

5. [Using Git Offline](using-git-offline.md)
   Version control without GitHub — local repos, branching, and collaboration via USB.

## Tools Available on This System

- **VSCodium** — Open-source VS Code. Launch with `codium` or from the application menu.
- **Ollama** — Local AI models. Run `ollama list` to see installed models.
- **GCC/G++** — C/C++ compiler. Compile with `gcc -o program program.c`.
- **Python 3** — Run scripts with `python3 script.py`.
- **Node.js** — JavaScript runtime. Run with `node script.js`.
- **Git** — Version control. Works entirely offline.
- **Neovim** — Terminal text editor. Launch with `nvim`.
- **GDB** — Debugger for C/C++.
- **Valgrind** — Memory analysis tool.
- **ShellCheck** — Shell script linter.

## Quick Start

Open a terminal and try:

```bash
# Start a Python project
mkdir ~/my-project && cd ~/my-project
python3 -c "print('Hello from ApocalypseOS!')"

# Ask AI for help
ollama run codellama "Write a Python function to sort a list"

# Open your project in VSCodium
codium ~/my-project
```
