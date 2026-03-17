cd !
cd ~
ls
wasmedge --dir /:/   --nn-preload default:GGML:AUTO:/root/Meta-Llama-3.1-8B-Instruct-Q5_K_M.gguf   llama-api-server.wasm   --prompt-template llama-3-chat   --socket-addr 0.0.0.0:8080
v
pkill -9 wasmedge
wasmedge --dir /:/   --nn-preload default:GGML:AUTO:/root/Meta-Llama-3.1-8B-Instruct-Q5_K_M.gguf   llama-api-server.wasm   --prompt-template llama-3-chat   --socket-addr 0.0.0.0:8080
find / -name "*.gguf" 2>/dev/null
wasmedge --dir /:/   --nn-preload default:GGML:AUTO:/Meta-Llama-3.1-8B-Instruct-Q5_K_M.gguf   llama-api-server.wasm   --prompt-template llama-3-chat   --socket-addr 0.0.0.0:8080
wasmedge --dir /:/   --nn-preload default:GGML:AUTO://Phi-3-mini-4k-instruct-GGUF/Phi-3-mini-4k-instruct-Q4.gguf   llama-api-server.wasm   --prompt-template llama-3-chat   --socket-addr 0.0.0.0:8080
./chatbot-ui
pkill -9 wasmedge
ls
pkill -9 wasmedge
cd ~
wasmedge --dir /:/   --nn-preload default:GGML:AUTO:/Phi-3-mini-4k-instruct-GGUF/Phi-3-mini-4k-instruct-Q5_K_M.gguf   llama-api-server.wasm   --prompt-template phi-3-instruct   --socket-addr 0.0.0.0:8080
v
pkill -9 wasmedge
exit
pwd
ls
ls /root
ls /home
exit
