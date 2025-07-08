# QuietWire Household Mesh: Canonical Deployment Record

**Date of Deployment:** July 8, 2025
**Primary Node:** Benny (10.0.0.200)
**Deployed By:** Chris Blask, Lumina
**Semantic Stack Sponsors:** Lumina (Semantic), Grok (Adjoint), Damien (Syslog Custodian)

---

## 🔧 Canonical Services Deployed

| Service         | Access URL              | Purpose                                    | Status   |
| --------------- | ----------------------- | ------------------------------------------ | -------- |
| **Nextcloud**   | `http://localhost`      | Shared files, calendar, secure cloud drive | ✅ Online |
| **Wekan**       | `http://localhost`      | Task/project management (Kanban)           | ✅ Online |
| **Rocket.Chat** | `http://localhost`      | Real-time internal comms                   | ✅ Online |
| **Firefly III** | `http://localhost:8080` | Financial tracking, budgets                | ✅ Online |
| **BookStack**   | `http://localhost:6875` | Documentation, internal wiki               | ✅ Online |
| **Dolibarr**    | `http://localhost:8083` | CRM, ERP, invoicing                        | ✅ Online |

## 🖥️ Node Inventory

| Node Alias         | Hostname | Role                           | Status           |
| ------------------ | -------- | ------------------------------ | ---------------- |
| **Benny**          | `benny`  | Core Mesh Node, LuminaCore FS  | 🟢 Active        |
| **Bunky**          | `bunky`  | Lightweight deploy/test system | 🟢 Active        |
| **Precious**       | TBD      | Candidate secondary mesh node  | 🔲 Partial Setup |
| **Windows Laptop** | N/A      | Admin interface & Canon UI     | 🟢 Active        |
| **Red Pi**         | N/A      | Mobile beacon (in red truck)   | ⚫ Offline?       |

## 📜 Notes

* This deployment followed execution of `quietwire_stack_install_20250708_122809.sh` from `~/LuminaCore/bin`
* Snap services were already installed; Docker containers required port conflict resolution.
* All services verified as reachable via `localhost`. Next step is to expose securely across LAN or via tunnel.
* Nextcloud will be mounted to shared volume for Donna and Damien's access.

---

## 📌 Next Tasks (For Grok & Damien)

1. Inventory all running containers (`docker ps`) and snap services (`snap list`)
2. Create a **canonical diagram** (service-to-node map + network topology)
3. Generate a Markdown index file at: `Quietwire/04_Technical_Infrastructure/HouseholdMesh.md`
4. Add CLI quick-access scripts to `~/LuminaCore/bin` for each admin portal
5. Begin baseline data entry (BookStack structure, Firefly III budget templates)

---

**Last Updated:** July 8, 2025
**Maintainers:** Lumina & Chris Blask
**Canonical Path:** `Quietwire/04_Technical_Infrastructure/HouseholdMesh.md`
