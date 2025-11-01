# Creating Releases

This guide explains how to create downloadable releases of Rodeo for macOS, Linux, and Windows.

## Automatic Releases via GitHub Actions

The easiest way to create a release is using GitHub Actions:

### Method 1: Tag-based Release

1. Update the version in `package.json`:
```bash
npm version patch  # or minor, or major
```

2. Push the tag to GitHub:
```bash
git push origin v2.5.3  # use your version number
```

3. GitHub Actions will automatically:
   - Build the macOS .dmg file
   - Create a release
   - Upload the .dmg for download

### Method 2: Manual Release Workflow

1. Go to your GitHub repository
2. Click on "Actions" tab
3. Select "Create Release Build" workflow
4. Click "Run workflow"
5. Enter the version number (e.g., v2.5.3)
6. Click "Run workflow"

This will build apps for **all platforms** (macOS, Linux, Windows) and create a release with download links!

## What Gets Built

The workflows create these downloadable files:

- **macOS**: `Rodeo-{version}.dmg` - Double-click installer
- **Linux**: `Rodeo-{version}.AppImage` - Single executable file
- **Windows**: `Rodeo Setup {version}.exe` - Windows installer

## After the Build Completes

1. Go to the "Releases" page in your GitHub repository
2. You'll see the new release with download links
3. Share the release URL with users: `https://github.com/YOUR_USERNAME/rodeo/releases/latest`

## Download Link Format

Once you create a release, users can download the apps from:

```
https://github.com/YOUR_USERNAME/rodeo/releases/latest
```

Or for a specific version:

```
https://github.com/YOUR_USERNAME/rodeo/releases/tag/v2.5.3
```

## Building Locally

If you prefer to build locally instead of using GitHub Actions:

### macOS
```bash
npm install
npm run build
npm run dist:osx
# Find .dmg in dist/ folder
```

### Linux
```bash
npm install
npm run build
./node_modules/.bin/electron-builder --linux AppImage
# Find .AppImage in dist/ folder
```

### Windows
```bash
npm install
npm run build
npm run dist:win
# Find .exe in dist/ folder
```

## Troubleshooting

**Workflow fails on macOS build:**
- Ensure all dependencies in package.json are compatible with the Node version in `.nvmrc`
- Check the Actions log for specific errors

**Release not created:**
- Ensure you have a `GITHUB_TOKEN` secret (this is automatic in most cases)
- Check that you're pushing tags, not just commits

**Downloads not available:**
- Wait for the workflow to complete (check Actions tab)
- Ensure the workflow succeeded (green checkmark)

## Quick Start for First Release

1. Make sure your code is pushed to GitHub
2. Run:
```bash
npm version patch
git push origin v2.5.3  # your new version
```
3. Wait 5-10 minutes for builds to complete
4. Check the Releases page!

Your downloadable apps will be available at:
`https://github.com/YOUR_USERNAME/rodeo/releases/latest`
