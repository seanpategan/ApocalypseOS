# Using Local AI for Coding

ApocalypseOS ships with Ollama, which lets you run AI language models entirely on your machine. No internet required after the initial model download.

## Basic Usage

```bash
# List installed models
ollama list

# Chat with a model
ollama run llama3

# Ask a one-off question
ollama run llama3 "Explain how Linux file permissions work"

# Use a code-specific model
ollama run codellama "Write a Python function to read a CSV file"
```

## Best Models for Coding

| Model | Size | Best For |
|-------|------|----------|
| codellama:34b | ~19GB | Best code generation (needs 32GB+ RAM) |
| codellama:7b | ~4GB | Good code help on moderate hardware |
| llama3:8b | ~4.7GB | General-purpose + coding |
| mistral:7b | ~4GB | Fast general-purpose |
| phi3:mini | ~2.3GB | Lightweight, surprisingly capable |
| tinyllama | ~637MB | Runs on almost anything |

## Coding Workflows

### Generate Code

```bash
ollama run codellama "Write a bash script that monitors disk space and warns when usage exceeds 90%"
```

### Explain Code

```bash
# Pipe code directly to the model
cat my_script.py | ollama run codellama "Explain what this code does line by line"
```

### Debug Errors

```bash
# Paste your error message
ollama run codellama "I'm getting this error in C: 'segmentation fault (core dumped)' when accessing array index. How do I debug this?"
```

### Code Review

```bash
cat main.c | ollama run codellama "Review this C code for bugs, memory leaks, and security issues"
```

### Generate Tests

```bash
cat utils.py | ollama run codellama "Write unit tests for these Python functions using pytest"
```

## Using the API

Ollama runs a local API server on port 11434:

```bash
# Start the server (usually auto-started)
ollama serve

# Make API requests
curl http://localhost:11434/api/generate -d '{
  "model": "codellama",
  "prompt": "Write a Python hello world",
  "stream": false
}'
```

### From Python

```python
import requests
import json

response = requests.post("http://localhost:11434/api/generate", json={
    "model": "codellama",
    "prompt": "Write a function to calculate Fibonacci numbers",
    "stream": False
})

result = response.json()
print(result["response"])
```

### From JavaScript

```javascript
const http = require("http");

const data = JSON.stringify({
    model: "codellama",
    prompt: "Write a function to sort an array",
    stream: false,
});

const req = http.request(
    { hostname: "localhost", port: 11434, path: "/api/generate", method: "POST",
      headers: { "Content-Type": "application/json" }},
    (res) => {
        let body = "";
        res.on("data", (chunk) => body += chunk);
        res.on("end", () => console.log(JSON.parse(body).response));
    }
);

req.write(data);
req.end();
```

## Managing Models

```bash
# Pull a new model (requires temporary internet)
ollama pull codellama:7b

# Remove a model to free disk space
ollama rm tinyllama

# Show model details
ollama show codellama

# Copy/rename a model
ollama cp codellama my-code-model
```

## Tips

- **Be specific** in your prompts. "Write a Python function that reads a CSV and returns the sum of column 3" works better than "help me with CSV".
- **Include context.** Pipe your actual code to the model for better results.
- **Use codellama** for code tasks — it's specifically trained for programming.
- **Smaller models are faster.** If you just need quick answers, phi3:mini responds much faster than larger models.
- **Models run in RAM.** If your system slows down, try a smaller model or close other applications.
