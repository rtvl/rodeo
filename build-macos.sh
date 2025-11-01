#!/bin/bash

# Rodeo macOS Build Script
# This script builds a .dmg file for macOS that you can drag to Applications

set -e  # Exit on error

echo "🚀 Building Rodeo for macOS..."
echo ""

# Check if we're on macOS
if [[ "$OSTYPE" != "darwin"* ]]; then
    echo "❌ Error: This script must be run on macOS"
    exit 1
fi

# Get the directory where this script is located
SCRIPT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
cd "$SCRIPT_DIR"

echo "📦 Step 1/3: Installing dependencies..."
npm install --legacy-peer-deps

echo ""
echo "🔨 Step 2/3: Building application..."
npm run build

echo ""
echo "💿 Step 3/3: Creating .dmg installer..."
./node_modules/.bin/electron-builder --mac dmg

echo ""
echo "✅ Build complete!"
echo ""
echo "📂 Your .dmg file is located in:"
echo "   $(pwd)/dist/"
echo ""
echo "🎉 Next steps:"
echo "   1. Open the dist/ folder"
echo "   2. Double-click the .dmg file"
echo "   3. Drag Rodeo to your Applications folder"
echo "   4. Open Applications and double-click Rodeo to run!"
echo ""

# Open the dist folder in Finder
if [ -d "dist" ]; then
    open dist/
fi
