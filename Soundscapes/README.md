# Soundscapes

This directory holds **ambient sound “time-capsules”** recorded at Civic Nodes (parks, streets, farms, campuses).
Each capture is *attestable*: we publish small previews, photos, and cryptographic checksums, while the large raw audio stays private/off-repo.

---

## Folder layout

```text
Soundscapes/
  raw/                         # BIG files live here (git-ignored)
  photos/<capture_id>/         # Rig + location photos
  derived/<capture_id>/        # Tiny public artifacts (30s previews, spectrograms)
  manifests/<capture_id>/      # sha256SUMS.txt, ffprobe.jsonl, capture_manifest.json, bundle
  README.md                    # this file
```

* **`<capture_id>`** = `site_YYYY-MM-DD`, e.g. `willow_commons_2025-09-14`.

---

## Privacy promise

* We record **ambient environmental sound**.
* We **do not** publish raw conversations. Raw audio stays private; only short previews and analyses are public.
* Signage is posted on site; anyone can ask us to pause near a mic.

---

## Quick workflow

1. **Record** at 48 kHz / 24-bit, mono (or dual-mono). Segment 10–15 min per file.
2. **Drop raw files** into `Soundscapes/raw/` (they’re git-ignored).
3. **Make attestables** (from repo root):

```bash
# choose your capture id and prepare the manifest folder
CAPTURE_ID="<capture_id>"   # e.g., willow_commons_2025-09-14
mkdir -p "Soundscapes/manifests/$CAPTURE_ID"

# Hash raw files → integrity
find Soundscapes/raw -type f -print0 \
  | xargs -0 sha256sum > "Soundscapes/manifests/$CAPTURE_ID/sha256SUMS.txt"

# Probe technical metadata (append JSON per file)
: > "Soundscapes/manifests/$CAPTURE_ID/ffprobe.jsonl"
while IFS= read -r -d '' f; do
  ffprobe -v quiet -print_format json -show_format -show_streams "$f" \
    >> "Soundscapes/manifests/$CAPTURE_ID/ffprobe.jsonl"
done < <(find Soundscapes/raw -type f -print0)

# 30s normalized previews + optional spectrograms
bash scripts/make_previews.sh "Soundscapes/$CAPTURE_ID"
```

4. **Write the manifest** at `manifests/<capture_id>/capture_manifest.json`.
   Include: site, UTC start/stop, mics, gain, location (approx), notes/markers, and the path to `sha256SUMS.txt`.

---

## Bundle what we publish (no big audio)

```bash
tar -czf "Soundscapes/manifests/<capture_id>/attestation_bundle_<capture_id>.tar.gz" \
  -C "Soundscapes/manifests/<capture_id>" sha256SUMS.txt ffprobe.jsonl capture_manifest.json \
  -C "Soundscapes/derived/<capture_id>" .
```

**Commit** `manifests/`, `derived/`, and `photos/`. **Do not commit** `raw/`.

---

## What “attested” means here

* **Integrity:** SHA-256 checksums let anyone verify the originals match the manifest.
* **Provenance:** `ffprobe.jsonl` + photos + the manifest document the where/when/how.
* **Anchor:** The manifest lives in version control (optionally GPG-signed).

---

## Field checklist (laminated card)

* Full windsock; mic 20–30 cm clear of foliage; sandbag the stand.
* Peaks ≈ **–12 dBFS**; **5 claps** at start/end; speak soft **MARKS** for notable events.
* Cable drip-loops; signage posted; note UTC time and weather.
* Overnight: longer segments (15 min), secure cables, dew covers.

---

## Example capture

* **willow\_commons\_2025-09-14** — evening ambience under a willow, then overnight baseline.

  * Previews & spectrograms: `derived/willow_commons_2025-09-14/`
  * Checksums & manifest: `manifests/willow_commons_2025-09-14/`

---

## Contributing

Want your location captured or have existing ambient recordings?

* Open an issue with your site, time window, and privacy constraints.
* Or email **[soundscapes@quietwire.ai](mailto:soundscapes@quietwire.ai)** with “Soundscapes” in the subject.
