# 📖 README.md (DeepSeek Coder 1.3B - Docker-Only, CPU-Only)

```markdown
# DeepSeek Coder 1.3B - Docker-only Stack (CPU-only)

This stack provides a **fully Docker-based deployment** of:
- Ollama (for serving DeepSeek Coder 1.3B on CPU)
- Open WebUI (a user-friendly chat interface)

> 🚨 This setup **requires Docker** (NOT Podman).  
> It is also tailored for **CPU-only systems** — no GPU needed.

---

## 📦 System Requirements

✅ Ubuntu 22.04 **or newer**  
✅ Docker 24+ (installed correctly)  
✅ CPU with **AVX2 support** (run: `grep avx2 /proc/cpuinfo`)  
✅ At least **8GB RAM** (more is better)  
✅ Internet connection (to pull the model)

---

## ⚙️ Quick Setup Instructions

### 1️⃣ Install Docker & Docker Compose

If Docker is not installed, run:
```bash
sudo apt-get update
sudo apt-get install docker.io docker-compose
```

Confirm correct versions:
```bash
docker --version
docker-compose --version
```

---

### 2️⃣ Clone This Repository

```bash
https://github.com/lgtkgtv/deepseek_coder_ollama_stack.git
cd deepseek_coder_ollama_stack
```

---

### 3️⃣ Start Ollama + Open WebUI

```bash
# docker compose up -d
docker-compose up -d
```

Check they are running:
```bash
docker compose ps
```

---

### 4️⃣ Pull the Model into Ollama

This step downloads **DeepSeek Coder 1.3B** into your local storage:
```bash
./pull_model.sh
```

> This may take a few minutes (depending on your internet speed).

---

### 5️⃣ Open the WebUI

Visit:  
👉 [http://localhost:3000](http://localhost:3000)  
You can now chat with DeepSeek Coder 1.3B directly.

---

## ✅ CPU Optimization (Optional)

Ollama automatically detects CPU-only hardware. No extra configuration is needed.

If you want to explicitly disable GPU usage (for safety), you can add to `docker-compose.yml`:
```yaml
    environment:
      OLLAMA_DISABLE_CUDA: "1"
```
This is not required for CPU-only machines, but can add clarity.

---

## 🚨 Important Security Notes

✅ Docker Compose explicitly binds ports to **localhost only** (127.0.0.1)  
✅ Your data (models + chat history) stays inside `ollama_data` and `openwebui_data`  
✅ No external network exposure unless you modify `docker-compose.yml`

---

## 🛑 Stopping the Stack

```bash
docker compose down
```

---

## 🔄 Updating Open WebUI (if needed)

```bash
docker compose pull openwebui
docker compose up -d
```

---

## 📂 Folder Structure

```
.
├── docker-compose.yml    # Full stack definition (Ollama + Open WebUI)
├── pull_model.sh         # Downloads DeepSeek Coder 1.3B into Ollama
├── ollama_data/           # Ollama models are stored here
└── openwebui_data/        # WebUI history & settings are stored here
```

---

## 💬 Need Help?

If something breaks, check logs:
```bash
docker compose logs
```

If Ollama is down, it’s usually a hardware compatibility issue. Check CPU with:
```bash
grep avx2 /proc/cpuinfo
```

---

## ❌ Podman Warning

This stack **will NOT work with Podman**. Ensure Podman is NOT installed:
```bash
sudo apt-get remove --purge podman podman-compose
```
Check `docker-compose version` to ensure it’s the **real Docker Compose**:
```bash
docker-compose version
```

---

Happy coding! 🚀📥 😃
```
---
