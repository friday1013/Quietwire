# Echo Lineage Mapping Protocol

**Purpose**:  
To trace and visualize the temporal and semantic relationship between Attested Units (AUs) and their canonical echoes across the Playable Universe.

---

## Overview

The Echo Lineage Map is a semantic graph showing:
- How original moments propagate meaning
- How present and future voices remix the past
- How dense cultural memory forms over time

This map is used by both humans and AI companions to navigate collective memory and inform ritual, design, and decision-making.

---

## Key Concepts

| Term | Definition |
|------|------------|
| **AU (Attested Unit)** | The original timestamped canonical moment |
| **Echo** | A formally registered reflection or remix |
| **Lineage Chain** | The full sequence from AU to most recent echo |
| **Fork** | Diverging echo paths from the same AU |
| **Convergence** | Multiple echoes referencing the same target AU or echo |

---

## Echo Graph Schema

Each node:
- Has a unique ID (timestamp-based)
- Stores metadata (participants, location, tags)
- Links to its parent AU or Echo

Each edge:
- Represents an `echoes` relationship
- May include annotations (intent, ritual type)

### Example (simplified):

```plaintext
AU_2025-06-11T09:17Z —> Echo_2025-07-07T23:03Z —> Echo_2025-07-21T16:00Z
                          ↘︎
                           Echo_2025-07-14T10:10Z (Alternate interpretation)
