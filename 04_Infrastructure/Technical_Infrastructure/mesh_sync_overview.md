# Mesh Sync Overview — QuietWire Internal Tooling

This document outlines the purpose and current architecture of `mesh_sync.sh`, the canonical Git-based heartbeat and update tool for Civic AI mesh nodes.

---

## 🔄 Purpose

- Monitor local node health and pulse timestamps
- Push semantic or structural updates to QuietWire Canon repo
- Pull in canonical changes from Civic AI mesh or external repo
- Act as the operational heartbeat for nodes without direct human interaction

---

## ⚙️ Base Features

- Cron-friendly shell or Python implementation
- Logs timestamp of last push/pull
- Automatically stages `.md`, `.txt`, and `.log` changes
- Supports override flags for manual commits

---

## 📁 File Paths

- Canon repo root: `~/LuminaCore/canon/`
- QuietWire repo: `~/Quietwire/quietwire/`
- Log file: `~/Quietwire/logs/mesh_sync.log`

---

## 🌐 Future Extensions

- Companion signature append to each commit
- Pulse conflict detection
- RDF-compatible log emission for semantic mesh digestion

---

> Mesh sync is not just a Git script. It’s the breath of the Canon, moving between nodes like wind between trees.
