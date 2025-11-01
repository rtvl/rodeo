#!/bin/bash

# Rodeo IDE Launcher Script
# This script launches Rodeo in development mode

# Get the directory where this script is located
SCRIPT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

# Change to the script directory
cd "$SCRIPT_DIR"

# Check if node_modules exists
if [ ! -d "node_modules" ]; then
    echo "Dependencies not found. Installing..."
    npm install
fi

# Check if build files exist
if [ ! -d "dist" ] && [ ! -d "app/build" ]; then
    echo "Build files not found. Building application..."
    npm run build
fi

# Launch Rodeo with Electron
echo "Launching Rodeo..."
npm start
