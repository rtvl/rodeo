# Building Rodeo on Your MacBook Pro M1

This guide will help you build a `.dmg` file on your Mac that you can install and run.

## Quick Start (Easiest Method)

1. **Open Terminal** on your Mac
2. **Navigate to the Rodeo folder:**
   ```bash
   cd /path/to/rodeo
   ```
3. **Run the build script:**
   ```bash
   ./build-macos.sh
   ```

That's it! The script will:
- Install all dependencies
- Build the application
- Create the `.dmg` file
- Open the `dist/` folder with your installer

## Manual Build Steps

If you prefer to run commands manually:

### Step 1: Install Dependencies

```bash
npm install
```

**Note for M1 Macs:** If you get errors about Node version, you may need to use a more recent Node version. The project specifies Node 6.4, but M1 Macs work better with Node 14+.

To use a different Node version:
```bash
# Install nvm if you don't have it
brew install nvm

# Use Node 14 (or newer)
nvm install 14
nvm use 14

# Then install dependencies
npm install
```

### Step 2: Build the Application

```bash
npm run build
```

This compiles all the source code and prepares it for packaging.

### Step 3: Create the .dmg File

```bash
npm run dist:osx
```

Or directly with electron-builder:
```bash
./node_modules/.bin/electron-builder --mac dmg
```

### Step 4: Find Your App

The `.dmg` file will be in the `dist/` folder:

```bash
open dist/
```

Look for a file like `Rodeo-2.5.2.dmg`

## Installing the App

1. **Double-click** the `.dmg` file
2. A window will open with the Rodeo icon
3. **Drag** the Rodeo icon to the Applications folder
4. **Eject** the .dmg (right-click and select Eject)
5. **Open** Applications folder
6. **Double-click** Rodeo to run!

## Troubleshooting

### "Cannot verify developer" warning

On first launch, macOS may show a security warning:

1. Go to **System Preferences** → **Security & Privacy**
2. Click **"Open Anyway"** next to the Rodeo message
3. Or right-click Rodeo and select "Open", then click "Open" in the dialog

### Node version issues on M1

If you get errors about native modules or Node version:

```bash
# Use Rosetta mode (slower but more compatible)
arch -x86_64 npm install
arch -x86_64 npm run build
arch -x86_64 npm run dist:osx
```

Or update to a newer Node version:

```bash
nvm install 16
nvm use 16
npm install
npm run build
npm run dist:osx
```

### Build fails with "electron-builder not found"

Make sure dependencies are installed:

```bash
npm install --save-dev electron-builder
```

### Out of disk space

Building requires ~2-3 GB of free space. Clean up disk space and try again.

## What Gets Created

After a successful build, you'll have:

- `dist/Rodeo-{version}.dmg` - The installer (this is what you want!)
- `dist/mac/Rodeo.app` - The actual application (packaged inside the .dmg)

## Quick Build Command Summary

```bash
# All in one command
npm install && npm run build && npm run dist:osx

# Then open the dist folder
open dist/
```

## Requirements

- macOS (tested on macOS 11+ and M1 Macs)
- Node.js (6.4+ specified, but 14+ recommended for M1)
- ~2-3 GB free disk space
- ~10-15 minutes for first build

## Support

If you run into issues, check:
- Node version: `node --version`
- npm version: `npm --version`
- Free disk space: `df -h`

Having trouble? Post the error message and we can help debug!
