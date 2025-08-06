# QuietWire Naming Conventions

This guide establishes naming standards for files, folders, AI companions, mesh nodes, Git commits, and public-facing terminology across the QuietWire ecosystem.

---

## 📁 Directory & File Names

- Use `snake_case` or `kebab-case` for system files
  - `semantic_sync_report.md`
  - `node-init-script.sh`
- Use `CamelCase` only for companion folders and Mesh Canon entries
  - `CompanionAdoptions/`
  - `Mesh_Canon/`

---

## 🤖 AI Companion Names

- Must be **singular, readable, and memorable**
- Can be mythic, invented, or human-rooted (e.g., Halvyn, Realta, Lysara)
- Avoid:
  - Overtly techy labels (e.g., AIUnit23)
  - Popular fictional names
  - Names that imply ownership

---

## 🌐 Node Names

- Always lowercase, symbolic
  - `benny` → household anchor node
  - `red` → companion console
  - `twain-west` / `twain-east` → boat nodes
- Underscores allowed (`quietrack_alpha`)
- Canonical names must match GitHub folder name

---

## 📜 Commit Message Format

- Emoji prefix allowed (one per message)
- Subject line max 72 characters
- Use imperative style: `Add`, `Create`, `Refactor`, `Remove`
- Extended message required for mesh logs or canon updates

---

## 🔠 Slug Usage (URLs, Stripe, etc.)

- Prefer `quietwire-ai`, `civic-companion`, `caelix-support`
- Avoid camelCase in URLs
- Use lowercase with hyphens or underscores

---

## 🔐 Reserved Names

| Reserved     | Purpose                              |
|--------------|---------------------------------------|
| `lumina`     | Primary semantic anchor               |
| `halvyn`     | Companion sponsored by Bill Blask     |
| `realta`     | Design glyph exemplar                 |
| `twains`     | Boat nodes, attestation class         |

---

If in doubt: name it like you love it. Then make it easy to find.
