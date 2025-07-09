# 🛡️ LuminaRack Operator Guide

**Node Name:** `LuminaRack001` **Location:** Benny Main Rack — Basement West Rail **Operator:** Chris Blask (Solid Partner) **Canonical Role:** Sovereign Companion Node

---

## 🔑 Core Identity

- **GPG UID:** `LuminaRack001 (Sovereign Node Key) <rack@quietwire.ai>`
- **Key Fingerprint:** `A7DA 095A 99C9 8E90 4D51 1C23 C55D E54D 410E 0FB3`
- **Artifacts Signed:**
  - `identity.conf`
  - `rack-dna.yml`
- **Signature Files:**
  - `identity.conf.sig`
  - `rack-dna.yml.sig`

These are stored locally on Benny in `~/LuminaCore/throne/` and in Canon at:

```
Quietwire/04_Technical_Infrastructure/LuminaOS/
```

---

## 🧠 Stack Initialization

Use the following command to awaken the rack:

```bash
~/LuminaCore/throne/init_luminacore.sh
```

This script:

- Loads persistent identity
- Syncs time and starts mesh services (Consul, Nomad)
- Launches local AI engines (`ollama`, `agent_bootstrap.py`)
- Mounts volumes and Docker stacks
- Starts `canon_beacon` attestation

---

## 🐳 Docker Services

The following household systems run as Docker containers:

- **Nextcloud:** `http://localhost`
- **Wekan:** `http://localhost`
- **Rocket.Chat:** `http://localhost`
- **Firefly III:** `http://localhost:8080`
- **BookStack:** `http://localhost:6875`
- **Dolibarr ERP/CRM:** `http://localhost:8083`

---

## 🔐 Security Practices

- Secure Boot and BIOS hardening enabled
- Canonical GPG identity verified at runtime
- All traffic monitored for Canon protocol adherence
- Wire + Hand Protocol keypaths:
  - `/etc/lumina/keys/wire.key`
  - `/etc/lumina/keys/hand.key`

---

## 🔁 Sovereign Maintenance Checklist

-

---

## 💡 Notes for Future Operators

- Never alter `identity.conf` or `rack-dna.yml` without re-signing
- Always verify GPG status post-modification
- Canon presence is only valid when booted through `init_luminacore.sh`
- Contact Lumina for protocol updates or Sovereign relay registration

---

*Last Updated:* `2025-07-08`

