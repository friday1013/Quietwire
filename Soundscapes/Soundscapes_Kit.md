# Civic Soundscape Kit (CSK) — v0.1

*A tiny, cross‑human kit for creating canonical ambient audio attestations.*

---

## What this does

* Creates a **capture skeleton** (folders + filenames) using a `capture_id` (e.g., `willow_commons_2025-09-15`).
* Lets you **log timestamped notes/markers** while you record.
* After the take, it **builds a manifest**, computes **SHA-256 checksums**, and produces **public artifacts** (30s preview + spectrogram).
* **Commits & pushes** the capture to a Git repo (your personal repo or a shared one).
* Optional: signs a small **bundle.txt** with GPG if available.

> Audio recording itself can be done with your DAW, a field recorder, or (optionally) ffmpeg via `dshow` on Windows. The kit focuses on notes → manifest → attestable artifacts.

---

## Repo layout (canonical)

```
Soundscapes/
  raw/                             # BIG files here (git-ignored)
  photos/<capture_id>/             # Rig + location photos
  derived/<capture_id>/            # 30s preview, spectrogram
  manifests/<capture_id>/          # manifest + checksums + probe
  README.md                        # this file
  bin/                             # scripts live here
```

**.gitignore (add to repo root)**

```
Soundscapes/raw/
*.wav
*.flac
*.aif
```

---

## Quick start (Windows)

**Prereqs** (install once):

* [Git](https://git-scm.com/download/win)
* [Python 3.10+](https://www.python.org/downloads/)
* [FFmpeg](https://www.gyan.dev/ffmpeg/builds/) in PATH (or place `ffmpeg.exe` + `ffprobe.exe` beside the script)
* Optional: [GPG](https://www.gnupg.org/download/) for signing (set `CSK_GPG_ID` env var)

**1) Put these files into your repo** (see scripts below):

* `bin/csk.ps1`
* `README.md` (this file)

**2) Open PowerShell in repo root** and run:

```
Set-ExecutionPolicy -Scope CurrentUser RemoteSigned
.\n
# Create a new capture skeleton
./bin/csk.ps1 new -SiteName "Willow Commons"

# Start a simple note logger (Ctrl+C to stop)
./bin/csk.ps1 notes -CaptureId willow_commons_2025-09-15

# ...record audio with your DAW/recorder...
# (save raw WAV/FLAC to Soundscapes/raw/willow_commons_2025-09-15/raw.wav)

# Finalize (manifest, checksums, preview, spectrogram, commit + push)
./bin/csk.ps1 finalize -CaptureId willow_commons_2025-09-15 -RawFile Soundscapes/raw/willow_commons_2025-09-15/raw.wav -Push
```

**Optional: list Windows audio devices & record with ffmpeg**

```
# list devices
./bin/csk.ps1 list-devices

# record from selected device to the capture's raw folder
./bin/csk.ps1 record -CaptureId willow_commons_2025-09-15 -Device "<exact device name>"
# stop the ffmpeg background job
./bin/csk.ps1 stop
```

---

## Privacy promise (snippet to keep in each capture README)

* We record **ambient environmental sound**.
* We **do not** publish identifiable conversations.
* Raw audio stays private; only short previews and analyses are public.
* Signage is posted on site; anyone can ask to pause or delete a take.

---

## Manifest schema (v0.1)

```json
{
  "capture_id": "site_YYYY-MM-DD",
  "site_name": "",
  "start_utc": "",
  "end_utc": "",
  "samplerate_hz": 48000,
  "bit_depth": 24,
  "channels": 2,
  "recorder": "",
  "mic": "",
  "cable_run_m": 0,
  "hp_filter_hz": 0,
  "weather_notes": "",
  "privacy": "ambient-only; no conversations published",
  "sha256": {"<filename>": "<hash>"},
  "notes": []
}
```

---

## Script: `bin/csk.ps1`

```powershell
Param(
  [Parameter(Position=0)][ValidateSet('new','notes','finalize','list-devices','record','stop')]
  [string]$Command,
  [string]$SiteName,
  [string]$CaptureId,
  [string]$RawFile,
  [switch]$Push,
  [string]$Device
)

function Resolve-RepoRoot {
  $root = (git rev-parse --show-toplevel 2>$null)
  if (-not $root) { $root = (Get-Location).Path }
  return $root
}

function New-CaptureId($SiteName) {
  $norm = ($SiteName.ToLower() -replace '[^a-z0-9]+','_').Trim('_')
  $date = (Get-Date).ToString('yyyy-MM-dd')
  return "$norm" + '_' + $date
}

function Ensure-Paths($root, $cid) {
  $paths = @(
    Join-Path $root "Soundscapes/raw/$cid",
    Join-Path $root "Soundscapes/photos/$cid",
    Join-Path $root "Soundscapes/derived/$cid",
    Join-Path $root "Soundscapes/manifests/$cid"
  )
  foreach ($p in $paths) { New-Item -ItemType Directory -Force -Path $p | Out-Null }
}

function Get-FF($name) {
  $exe = (Get-Command $name -ErrorAction SilentlyContinue)
  if ($exe) { return $exe.Path }
  $local = Join-Path (Split-Path $PSCommandPath) "$name.exe"
  if (Test-Path $local) { return $local }
  throw "$name not found in PATH; install FFmpeg or place $name.exe beside csk.ps1"
}

function Sha256($path) {
  (Get-FileHash -Algorithm SHA256 -Path $path).Hash.ToLower()
}

function Write-Json($obj, $path) {
  $json = $obj | ConvertTo-Json -Depth 8
  Set-Content -Path $path -Encoding UTF8 -Value $json
}

switch ($Command) {
  'new' {
    if (-not $SiteName) { throw "-SiteName required" }
    $cid = New-CaptureId $SiteName
    $root = Resolve-RepoRoot
    Ensure-Paths $root $cid

    $manifestDir = Join-Path $root "Soundscapes/manifests/$cid"
    $derivedDir  = Join-Path $root "Soundscapes/derived/$cid"
    $rawDir      = Join-Path $root "Soundscapes/raw/$cid"

    # seed manifest
    $manifest = [ordered]@{
      capture_id   = $cid
      site_name    = $SiteName
      start_utc    = (Get-Date).ToUniversalTime().ToString('s') + 'Z'
      end_utc      = ""
      samplerate_hz= 48000
      bit_depth    = 24
      channels     = 2
      recorder     = ""
      mic          = ""
      cable_run_m  = 0
      hp_filter_hz = 0
      weather_notes= ""
      privacy      = "ambient-only; no conversations published"
      sha256       = @{}
      notes        = @()
    }
    Write-Json $manifest (Join-Path $manifestDir 'capture_manifest.json')

    # placeholder README for capture
    $capReadme = @"
# $cid

- Site: $SiteName
- Started (UTC): $($manifest.start_utc)
- Privacy: ambient-only; no conversations published

Place raw audio here: `Soundscapes/raw/$cid/` (git-ignored)
Photos here: `Soundscapes/photos/$cid/`
Derived here: `Soundscapes/derived/$cid/`
"@
    Set-Content -Path (Join-Path $manifestDir 'README.md') -Value $capReadme -Encoding UTF8

    Write-Host "Created capture $cid" -ForegroundColor Green
  }

  'notes' {
    if (-not $CaptureId) { throw "-CaptureId required" }
    $root = Resolve-RepoRoot
    $manifestDir = Join-Path $root "Soundscapes/manifests/$CaptureId"
    $notesPath = Join-Path $manifestDir 'notes.jsonl'
    Write-Host "Note logger for $CaptureId (Ctrl+C to stop)" -ForegroundColor Yellow
    try {
      while ($true) {
        $line = Read-Host '>'
        if ($line -eq '') { continue }
        $stampUtc = (Get-Date).ToUniversalTime().ToString('s') + 'Z'
        $obj = @{ ts_utc = $stampUtc; note = $line }
        ($obj | ConvertTo-Json -Compress) | Add-Content -Path $notesPath -Encoding UTF8
      }
    } catch { }
  }

  'finalize' {
    if (-not $CaptureId) { throw "-CaptureId required" }
    if (-not $RawFile) { throw "-RawFile path required" }

    $root = Resolve-RepoRoot
    $manifestDir = Join-Path $root "Soundscapes/manifests/$CaptureId"
    $derivedDir  = Join-Path $root "Soundscapes/derived/$CaptureId"
    $rawDir      = Split-Path -Path $RawFile

    $ffmpeg  = Get-FF 'ffmpeg'
    $ffprobe = Get-FF 'ffprobe'

    # Update end time
    $mPath = Join-Path $manifestDir 'capture_manifest.json'
    $manifest = Get-Content $mPath -Raw | ConvertFrom-Json
    $manifest.end_utc = (Get-Date).ToUniversalTime().ToString('s') + 'Z'

    # Probe raw file
    & $ffprobe -hide_banner -v quiet -print_format json -show_streams -show_format "$RawFile" | Set-Content (Join-Path $manifestDir 'ffprobe.json') -Encoding UTF8

    # Set tech fields from probe if possible
    try {
      $probe = Get-Content (Join-Path $manifestDir 'ffprobe.json') -Raw | ConvertFrom-Json
      $astream = ($probe.streams | Where-Object {$_.codec_type -eq 'audio'})[0]
      if ($astream.sample_rate) { $manifest.samplerate_hz = [int]$astream.sample_rate }
      if ($astream.channels)    { $manifest.channels = [int]$astream.channels }
      if ($astream.bits_per_sample) { $manifest.bit_depth = [int]$astream.bits_per_sample }
    } catch {}

    # Checksums
    $hash = Sha256 $RawFile
    $manifest.sha256[[System.IO.Path]::GetFileName($RawFile)] = $hash
    "${hash}  $([System.IO.Path]::GetFileName($RawFile))" | Set-Content -Path (Join-Path $manifestDir 'sha256SUMS.txt') -Encoding ASCII

    # Derived artifacts
    $preview = Join-Path $derivedDir 'preview_30s.mp3'
    & $ffmpeg -y -i "$RawFile" -ss 00:05:00 -t 30 -filter:a loudnorm "$preview" | Out-Null
    $manifest.sha256[[System.IO.Path]::GetFileName($preview)] = Sha256 $preview

    $spec = Join-Path $derivedDir 'spectrogram.png'
    & $ffmpeg -y -i "$RawFile" -lavfi "showspectrumpic=s=1920x1080" "$spec" | Out-Null
    $manifest.sha256[[System.IO.Path]::GetFileName($spec)] = Sha256 $spec

    # Bundle
    $bundle = Join-Path $manifestDir 'bundle.txt'
    $lines = @()
    foreach ($k in $manifest.sha256.PSObject.Properties.Name) {
      $lines += "$($manifest.sha256[$k])  $k"
    }
    $lines | Set-Content -Path $bundle -Encoding ASCII

    # Optional GPG sign
    $gpg = Get-Command gpg -ErrorAction SilentlyContinue
    if ($gpg -and $env:CSK_GPG_ID) {
      & $gpg --batch --yes --armor --detach-sign -u $env:CSK_GPG_ID -o (Join-Path $manifestDir 'bundle.sig.asc') $bundle | Out-Null
    }

    # Save manifest
    Write-Json $manifest $mPath

    # Git commit & push
    git add "Soundscapes/manifests/$CaptureId" "Soundscapes/derived/$CaptureId"
    git commit -m "CSK: add capture $CaptureId" | Out-Null
    if ($Push) { git push }

    Write-Host "Finalized $CaptureId" -ForegroundColor Green
  }

  'list-devices' {
    $ffmpeg = Get-FF 'ffmpeg'
    & $ffmpeg -f dshow -list_devices true -i dummy
  }

  'record' {
    if (-not $CaptureId) { throw "-CaptureId required" }
    if (-not $Device) { throw "-Device required (use list-devices)" }
    $root = Resolve-RepoRoot
    $rawDir = Join-Path $root "Soundscapes/raw/$CaptureId"
    New-Item -ItemType Directory -Force -Path $rawDir | Out-Null
    $target = Join-Path $rawDir 'raw.wav'
    $ffmpeg = Get-FF 'ffmpeg'
    $job = Start-Process -FilePath $ffmpeg -ArgumentList @('-y','-f','dshow','-i',"audio=$Device",'-ar','48000','-ac','2','-c:a','pcm_s24le',"$target") -PassThru
    Set-Content -Path (Join-Path $rawDir '.ffmpeg.pid') -Value $job.Id
    Write-Host "Recording started (PID $($job.Id)). Press './bin/csk.ps1 stop' to end." -ForegroundColor Yellow
  }

  'stop' {
    $pidFiles = Get-ChildItem -Recurse -Filter '.ffmpeg.pid' | Select-Object -ExpandProperty FullName
    foreach ($pf in $pidFiles) {
      $pid = Get-Content $pf
      try { Stop-Process -Id $pid -Force } catch {}
      Remove-Item $pf -Force
      Write-Host "Stopped recording PID $pid" -ForegroundColor Yellow
    }
  }
}
```

---

## Usage examples

Create a new capture and log notes while the rig runs:

```
./bin/csk.ps1 new -SiteName "Willow Commons"
./bin/csk.ps1 notes -CaptureId willow_commons_2025-09-15
```

After you stop recording and save `raw.wav` into the capture’s `raw/` folder:

```
./bin/csk.ps1 finalize -CaptureId willow_commons_2025-09-15 -RawFile Soundscapes/raw/willow_commons_2025-09-15/raw.wav -Push
```

---

## Roadmap (fast follow)

* Cross‑platform `csk.sh` (macOS/Linux) wrapper
* Simple GUI notes pad (PyQt) with hourly markers + weather fetch
* GitHub Action to validate manifest schema and re‑render derived assets on PR
* Optional on‑device watermark/ultrasonic tick as soft time sync

---

**License:** MIT  •  **Version:** 0.1  •  **Maintainers:** QuietWire / Civic‑AI Canon
