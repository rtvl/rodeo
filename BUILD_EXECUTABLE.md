# Building Rodeo as an Executable Application

This guide explains how to create executable versions of Rodeo that can be run with a simple click.

## Quick Start - Development Mode

For immediate use without building, you can use the launcher script:

```bash
./run-rodeo.sh
```

This script will:
1. Install dependencies if needed
2. Build the application if needed
3. Launch Rodeo in development mode

## Building a Production Executable

### Option 1: AppImage (Recommended for Linux)

AppImage creates a single executable file that works on most Linux distributions without installation.

**Steps:**

1. Install dependencies:
```bash
npm install
```

2. Build the application:
```bash
npm run build
```

3. Create the AppImage:
```bash
npm run dist:linux
```

Or use electron-builder directly:
```bash
./node_modules/.bin/electron-builder --linux AppImage
```

4. Find your executable:
```bash
ls dist/*.AppImage
```

5. Make it executable and run:
```bash
chmod +x dist/Rodeo-*.AppImage
./dist/Rodeo-*.AppImage
```

**The AppImage file can be copied anywhere and run with a double-click!**

### Option 2: Desktop Integration

To integrate Rodeo with your desktop environment:

1. Copy the desktop file to your applications directory:
```bash
cp rodeo.desktop ~/.local/share/applications/
```

2. Update the desktop file with absolute paths:
```bash
sed -i "s|/home/user/rodeo|$(pwd)|g" ~/.local/share/applications/rodeo.desktop
```

3. Update desktop database:
```bash
update-desktop-database ~/.local/share/applications/
```

Now Rodeo will appear in your application launcher!

### Option 3: Other Linux Packages

Build other package formats:

**Debian Package (.deb):**
```bash
./node_modules/.bin/electron-builder --linux deb
```

**RPM Package:**
```bash
./node_modules/.bin/electron-builder --linux rpm
```

**All formats:**
```bash
npm run dist:linux
```

## Platform-Specific Builds

### macOS
```bash
npm run dist:osx
```
This creates a `.dmg` file you can double-click to install.

### Windows
```bash
npm run dist:win
```
This creates a Windows installer.

## Troubleshooting

**"Cannot find module" errors:**
- Run `npm install` to install dependencies
- Run `npm run build` to build the application

**"Permission denied" errors:**
- Make scripts executable: `chmod +x run-rodeo.sh`
- Make AppImage executable: `chmod +x dist/*.AppImage`

**AppImage won't run:**
- Install FUSE: `sudo apt-get install fuse libfuse2`
- Or extract and run: `./Rodeo-*.AppImage --appimage-extract && ./squashfs-root/AppRun`

## File Overview

- `run-rodeo.sh` - Quick launcher script for development
- `rodeo.desktop` - Desktop entry file for Linux integration
- `package.json` - Build configuration (see "build" and "scripts" sections)
- `dist/` - Output directory for built executables (created after building)

## Requirements

- Node.js (version specified in `.nvmrc` or `package.json`)
- npm or yarn
- For AppImage: FUSE library on Linux

## More Information

- [Electron Builder Documentation](https://www.electron.build/)
- [AppImage Documentation](https://appimage.org/)
