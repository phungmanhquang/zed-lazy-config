#!/bin/bash

# --- Configuration ---
# ĐỂ LỆNH CURL HOẠT ĐỘNG, HÃY ĐẢM BẢO URL DƯỚI ĐÂY LÀ ĐÚNG VỚI REPO CỦA BẠN
REPO_URL="https://github.com/phungmanhquang/zed-lazy-config"
TARGET_DIR="$HOME/.config/zed"

echo "------------------------------------------"
echo "🛠️  Zed Configuration Installer"
echo "------------------------------------------"

# Detect if we need to download the source (Remote Mode)
if [ ! -d "./config" ]; then
    echo "🌍 Remote mode detected. Syncing from GitHub..."
    TMP_DIR=$(mktemp -d)
    
    # Sử dụng git clone shallow để lấy file nhanh và chính xác nhất
    if git clone --depth 1 "$REPO_URL.git" "$TMP_DIR" > /dev/null 2>&1; then
        SOURCE_DIR="$TMP_DIR/config"
        REMOTE=true
    else
        echo "❌ Error: Could not reach the repository at $REPO_URL"
        echo "   Please check if the REPO_URL in install.sh is correct and public."
        rm -rf "$TMP_DIR"
        exit 1
    fi
else
    echo "🏠 Local mode detected. Using files from ./config"
    SOURCE_DIR="./config"
    REMOTE=false
fi

# Ensure target directory exists
mkdir -p "$TARGET_DIR"

echo "🚀 Syncing configuration to $TARGET_DIR..."

# Copy files
if [ -d "$SOURCE_DIR" ]; then
    find "$SOURCE_DIR" -type f -print0 | while IFS= read -r -d '' file; do
        rel_path="${file#$SOURCE_DIR/}"
        dest_path="$TARGET_DIR/$rel_path"
        
        mkdir -p "$(dirname "$dest_path")"
        cp "$file" "$dest_path"
        echo "  ✅ Copied: $rel_path"
    done
else
    echo "❌ Error: 'config' directory not found in the source!"
    [ "$REMOTE" = true ] && rm -rf "$TMP_DIR"
    exit 1
fi

# Cleanup if in remote mode
if [ "$REMOTE" = true ]; then
    rm -rf "$TMP_DIR"
fi

echo "------------------------------------------"
echo "✨ Done! Your Zed configuration is synced."
echo "📂 Location: $TARGET_DIR"
echo "------------------------------------------"
