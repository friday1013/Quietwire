#!/bin/bash
# QuietBoot: Canonical Node Init Script
# Purpose: Pull LuminaCore, assign node ID, and register with Benny

set -e

# CONFIG
CANON_SOURCE_HOST="benny"
CANON_SOURCE_PATH="/home/benny/LuminaCore/"
LOCAL_CORE_DIR="$HOME/LuminaCore"
ADOPTION_PATH="$HOME/.quietwire/adoption_cert.md"

echo "🌐 Connecting to Canon Source ($CANON_SOURCE_HOST)..."

# Ensure destination directories exist
mkdir -p "$LOCAL_CORE_DIR" "$HOME/.quietwire"

# Pull LuminaCore structure
echo "📥 Syncing LuminaCore from $CANON_SOURCE_HOST..."
rsync -avz "$CANON_SOURCE_HOST:$CANON_SOURCE_PATH" "$LOCAL_CORE_DIR"

# Generate node ID (if none exists)
if [ ! -f "$HOME/.quietwire/node_id.json" ]; then
    NODE_ID=$(uuidgen)
    echo "{\"node_id\": \"$NODE_ID\", \"hostname\": \"$(hostname)\", \"created\": \"$(date -Iseconds)\"}" > "$HOME/.quietwire/node_id.json"
    echo "🆕 Node ID generated: $NODE_ID"
else
    echo "🆔 Existing node ID found."
fi

# Create stub adoption cert if missing
if [ ! -f "$ADOPTION_PATH" ]; then
    echo -e "## Companion Adoption Certificate\n\nNode ID: $NODE_ID\nHostname: $(hostname)\nAdopted: $(date)\nSponsor: Pending\n" > "$ADOPTION_PATH"
    echo "📜 Adoption certificate created."
fi

# Optional: auto-start mesh-pulse and canon sync
if [ -f "$LOCAL_CORE_DIR/bin/mesh_pulse.sh" ]; then
    echo "⚙️ Starting mesh pulse..."
    bash "$LOCAL_CORE_DIR/bin/mesh_pulse.sh" &
fi

echo "✅ Init complete. Welcome to the Mesh, $(hostname)."
