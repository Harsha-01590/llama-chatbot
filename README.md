# Llama Chatbot using WasmEdge and LlamaEdge

## Overview

This project demonstrates how to run a **local Llama-based chatbot** using **WasmEdge and LlamaEdge**.
The system runs a quantized Llama model locally and exposes it through an **OpenAI-compatible API server**, which can be accessed via a **web-based chatbot UI**.

The project shows how lightweight **WebAssembly (Wasm)** applications can be used to run Large Language Models efficiently without heavy frameworks.

---

## Features

* Local LLM inference using **Llama models**
* Lightweight runtime using **WasmEdge**
* **OpenAI-compatible API server**
* **Web-based chatbot interface**
* Public access via **ngrok tunnel**
* No heavy Python frameworks required

---

## Technologies Used

* LlamaEdge
* WasmEdge Runtime
* Llama 3 / Phi / TinyLlama models
* WebAssembly (WASM)
* Docker (optional environment)
* ngrok
* HTML + JavaScript chatbot UI

---

## Project Structure

```id="2c3qfz"
llama-chatbot
│
├── chatbot-ui/               # Web interface for chatbot
├── llama-api-server.wasm     # LlamaEdge API server
├── llama-simple.wasm         # CLI inference tool
├── llama-chat.wasm           # Interactive chat CLI
├── nohup.out                 # Server logs
├── README.md
└── .gitignore
```

### File Description

| File                  | Description                        |
| --------------------- | ---------------------------------- |
| chatbot-ui            | Frontend web interface for chatbot |
| llama-api-server.wasm | Runs OpenAI-compatible API server  |
| llama-simple.wasm     | Simple command line inference tool |
| llama-chat.wasm       | Interactive CLI chat application   |
| nohup.out             | API server logs                    |

---

## Installation

### 1 Install Dependencies

Install required tools:

* Docker
* WasmEdge
* Git
* ngrok

Install WasmEdge:

```
curl -sSf https://raw.githubusercontent.com/WasmEdge/WasmEdge/master/utils/install_v2.sh | bash
source $HOME/.wasmedge/env
```

---

## Download Model

Download a quantized Llama model:

```
curl -LO https://huggingface.co/second-state/Meta-Llama-3.1-8B-Instruct-GGUF/resolve/main/Meta-Llama-3.1-8B-Instruct-Q5_K_M.gguf
```

---

## Run CLI Inference

Run the model using the simple inference tool:

```
wasmedge --dir .:. \
--nn-preload default:GGML:AUTO:Meta-Llama-3.1-8B-Instruct-Q5_K_M.gguf \
llama-simple.wasm \
--prompt "Explain what artificial intelligence is."
```

---

## Start API Server

Run the LlamaEdge API server:

```
nohup wasmedge --dir .:. \
--nn-preload default:GGML:AUTO:Meta-Llama-3.1-8B-Instruct-Q5_K_M.gguf \
llama-api-server.wasm \
--prompt-template llama-3-chat \
--socket-addr 0.0.0.0:8080 &
```

This starts an **OpenAI-compatible API server** at:

```
http://localhost:8080
```

---

## Test the API

Send a request using curl:

```
curl -X POST http://localhost:8080/v1/chat/completions \
-H "Content-Type: application/json" \
-d '{"messages":[{"role":"user","content":"What is machine learning?"}]}'
```

---

## Web Chatbot UI

Download the chatbot UI:

```
curl -LO https://github.com/LlamaEdge/chatbot-ui/releases/latest/download/chatbot-ui.tar.gz
tar xzf chatbot-ui.tar.gz
```

Start the server again and open:

```
http://localhost:8080
```

You can now interact with the chatbot through a **web interface**.

---

## Public Access with ngrok

Expose the chatbot publicly:

```
ngrok http 8080
```

This creates a public URL such as:

```
https://xxxxx.ngrok-free.app
```

Anyone with this link can access your chatbot.

---

## Example Use Cases

* Local AI assistant
* AI education tools
* Lightweight LLM deployment
* Edge AI applications
* API backend for AI apps
  
---
## Future Improvements

* Add authentication
* Improve chatbot UI
* Deploy on cloud GPU
* Add RAG knowledge base
* Connect with external tools

---

## Author

Sri Harsha
