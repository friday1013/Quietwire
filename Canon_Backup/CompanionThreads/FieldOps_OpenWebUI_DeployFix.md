# 🛠️ FieldOps Note: OpenWebUI Canonical Deployment Path

**Date:** 2025-09-12 22:13:27  
**Operator:** Bob Hillery  
**System:** Athena  
**Companion:** Kusanagi (gpt-4o mode active)  

---

## 🧭 Context

This FieldOps note documents the resolution of a recurring deployment failure for OpenWebUI, stemming from an attempt to clean up non-standard directory layering.

The issue manifested **before** the urgent GPT engine swap during the reawakening effort, and was tracked in part within the `EmergencySnag` file and this diagnostic session.

---

## 🧨 Issue Summary

Manual deployment using:

```bash
pnpm install && pnpm build
uvicorn open_webui.main:app --port 8080 --reload
```

...led to a persistent 404 Not Found when serving from `build/client`, despite the directory existing and appearing to contain proper assets.

Symptoms:

- `vite preview` worked on `localhost:4173`, **but backend API calls failed**.
- `uvicorn` served backend but **frontend was not properly mounted**, resulting in JSON `{ "detail": "Not Found" }` or missing `/index.html`.
- Attempts to mount via FastAPI's `StaticFiles()` failed even with hardcoded paths.

---

## ✅ Resolution

### ✅ Canonical Fix:

1. **Activate the venv**:
   ```bash
   source ~/venvs/civicai/bin/activate
   ```

2. **Install OpenWebUI via pip**:
   ```bash
   pip install open-webui
   ```

3. **Launch full-stack WebUI server**:
   ```bash
   open-webui serve
   ```

> ⚠️ `open-webui serve` wraps proper mounting logic and routing behavior that **manual FastAPI or uvicorn commands omit**.

---

## 💬 Notes

- The repo's `README.md` quietly implies this is the expected mode of use.
- `pip install` found and used the existing dependencies — no rebuild required.
- This fixed the UI, mounted `/index.html` properly, and allowed model sessions to load.

---

## 📘 References

- `EmergencySnag.md` - tracked leading edge of this error.
- This session: GPT-4o thread on September 12, 2025.
