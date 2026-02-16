# Getting Started with JavaScript

JavaScript powers the web, but with Node.js it's also a powerful general-purpose language for building tools, servers, and applications — all offline.

## Your First Script

Create `hello.js`:

```javascript
console.log("Hello from ApocalypseOS!");
```

Run it:

```bash
node hello.js
```

## Variables and Types

```javascript
const name = "Survivor";          // Constant (can't reassign)
let supplies = 50;                // Variable (can reassign)
const isSecure = true;            // Boolean

// Arrays
const items = ["water", "food", "radio"];
items.push("batteries");
console.log(items[0]);  // "water"

// Objects
const inventory = {
    water: 50,
    food: 30,
    batteries: 24,
};
console.log(inventory.water);
```

## Functions

```javascript
// Regular function
function calculateSupplies(people, days) {
    const water = people * 3 * days;
    const food = people * 2000 * days;
    return { water, food };
}

// Arrow function
const greet = (name) => `Welcome to ApocalypseOS, ${name}!`;

const result = calculateSupplies(4, 30);
console.log(`Water needed: ${result.water} liters`);
console.log(greet("Survivor"));
```

## File I/O

```javascript
const fs = require("fs");

// Write a file
fs.writeFileSync("log.txt", "Day 1: All systems operational\n");

// Append to a file
fs.appendFileSync("log.txt", "Day 2: Backup completed\n");

// Read a file
const content = fs.readFileSync("log.txt", "utf-8");
console.log(content);

// Read line by line
const lines = content.split("\n").filter(Boolean);
lines.forEach((line, i) => {
    console.log(`Line ${i + 1}: ${line}`);
});

// Check if file exists
if (fs.existsSync("config.json")) {
    const config = JSON.parse(fs.readFileSync("config.json", "utf-8"));
    console.log(config);
}
```

## Working with JSON

```javascript
const fs = require("fs");

// Create structured data
const systemStatus = {
    hostname: "apocalypseos",
    uptime: process.uptime(),
    wireless: "disabled",
    firewall: "active",
    backupLast: "2026-01-15",
};

// Save to JSON
fs.writeFileSync("status.json", JSON.stringify(systemStatus, null, 2));

// Load from JSON
const loaded = JSON.parse(fs.readFileSync("status.json", "utf-8"));
console.log(`Wireless: ${loaded.wireless}`);
```

## Running Shell Commands

```javascript
const { execSync } = require("child_process");

// Run a command and get output
const uptime = execSync("uptime", { encoding: "utf-8" });
console.log(uptime.trim());

// Check disk space
const df = execSync("df -h /", { encoding: "utf-8" });
console.log(df);
```

## Building a Simple CLI Tool

Create `tool.js`:

```javascript
const args = process.argv.slice(2);
const command = args[0];

switch (command) {
    case "status":
        console.log("ApocalypseOS: All systems operational");
        break;
    case "help":
        console.log("Commands: status, help, version");
        break;
    case "version":
        console.log("ApocalypseOS Tools v1.0.0");
        break;
    default:
        console.log(`Unknown command: ${command}`);
        console.log("Run with 'help' for available commands");
}
```

```bash
node tool.js status
node tool.js help
```

## Project Structure

```
my-project/
├── index.js          # Entry point
├── lib/
│   └── utils.js      # Helper modules
├── package.json      # Project metadata
├── data/             # Data files
└── README.md
```

Initialize a project:

```bash
mkdir my-project && cd my-project
npm init -y
```

## Next Steps

- Explore Node.js built-in modules: `fs`, `path`, `os`, `crypto`, `http`
- Build a local HTTP server: `node -e "require('http').createServer((req,res)=>{res.end('OK')}).listen(3000)"`
- Ask your local AI: `ollama run codellama "Build a Node.js file watcher"`
