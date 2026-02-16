# Getting Started with Python

Python is a beginner-friendly language perfect for scripting, automation, data processing, and building applications.

## Your First Program

Create a file called `hello.py`:

```python
print("Hello from ApocalypseOS!")
```

Run it:

```bash
python3 hello.py
```

## Variables and Types

```python
name = "Survivor"          # String
age = 25                   # Integer
temperature = 98.6         # Float
is_online = False          # Boolean (always False on ApocalypseOS!)

# Lists
supplies = ["water", "food", "radio", "batteries"]
supplies.append("first aid kit")

# Dictionaries
inventory = {
    "water_liters": 50,
    "food_days": 30,
    "batteries": 24
}
```

## Functions

```python
def calculate_supplies(people, days):
    water_needed = people * 3 * days  # 3 liters per person per day
    food_needed = people * 2000 * days  # 2000 calories per person per day
    return water_needed, food_needed

water, food = calculate_supplies(4, 30)
print(f"Need {water} liters of water and {food} calories of food")
```

## Reading and Writing Files

```python
# Write to a file
with open("log.txt", "w") as f:
    f.write("Day 1: All systems operational\n")
    f.write("Day 2: Backup completed\n")

# Read from a file
with open("log.txt", "r") as f:
    for line in f:
        print(line.strip())

# Append to a file
with open("log.txt", "a") as f:
    f.write("Day 3: Security audit passed\n")
```

## Working with the Command Line

```python
import subprocess
import os

# Run a shell command
result = subprocess.run(["uname", "-a"], capture_output=True, text=True)
print(result.stdout)

# List files
for item in os.listdir("/home"):
    print(item)

# Check disk space
result = subprocess.run(["df", "-h"], capture_output=True, text=True)
print(result.stdout)
```

## Error Handling

```python
try:
    with open("important_data.txt", "r") as f:
        data = f.read()
except FileNotFoundError:
    print("File not found — creating it")
    with open("important_data.txt", "w") as f:
        f.write("initialized")
except PermissionError:
    print("Permission denied — try running with sudo")
```

## Virtual Environments

Keep project dependencies isolated:

```bash
# Create a virtual environment
python3 -m venv myproject-env

# Activate it
source myproject-env/bin/activate

# Install packages (from local .whl files since we're offline)
pip install /path/to/package.whl

# Deactivate when done
deactivate
```

## Project Structure

A good Python project layout:

```
my-project/
├── main.py           # Entry point
├── utils.py          # Helper functions
├── config.py         # Configuration
├── tests/
│   └── test_utils.py # Tests
├── data/             # Data files
└── README.md         # Documentation
```

## Next Steps

- Explore the Python standard library — it's massive and works fully offline
- Use `python3 -m http.server` to serve files on your local network
- Use `sqlite3` module for local databases
- Ask your local AI: `ollama run codellama "Explain Python decorators"`
