# Rodeo

## [Rodeo Desktop](https://www.yhat.com/products/rodeo)
![](http://blog.yhathq.com/static/img/rodeo-overview.png)

![](https://ga-beacon.appspot.com/UA-46996803-1/rodeo/README.md)

## Install
Check [bareback.s.yhat.com](http://bareback.s.yhat.com) for the latest release. Download it!

## Building from Source for macOS M1/M2 (Apple Silicon)

This project has been updated to support macOS M1/M2 (ARM64) architecture. Follow these steps to build from source:

### Prerequisites

1. Install [Homebrew](https://brew.sh/) if not already installed
2. Install Node Version Manager (nvm):
   ```bash
   brew install nvm
   ```
3. Add nvm to your shell profile and restart your terminal

### Build Steps

1. Clone the repository:
   ```bash
   git clone https://github.com/yhat/rodeo.git
   cd rodeo
   ```

2. Install Node.js (the project now uses Node 16.20.2):
   ```bash
   nvm install
   nvm use
   ```

3. Install dependencies:
   ```bash
   npm install
   ```

   **Note**: If you encounter errors with native modules during installation, you may need to:
   - Ensure Xcode Command Line Tools are installed: `xcode-select --install`
   - Clear npm cache: `npm cache clean --force`
   - Remove `node_modules` and reinstall: `rm -rf node_modules && npm install`

4. Build the application:
   ```bash
   npm run build
   ```

5. Run in development mode:
   ```bash
   npm start
   ```

6. Create a distributable for macOS (will auto-detect ARM64 on M1/M2):
   ```bash
   npm run dist:osx
   ```

   This will create a DMG and ZIP file in the `dist` directory, built specifically for your architecture (ARM64 on M1/M2, x64 on Intel).

### Important Notes

- **Electron Update**: The project has been updated from Electron 1.4.10 to 15.5.7 for M1 support. This is a major version jump and some APIs may have changed. Please report any issues.
- **Node.js Version**: The project now requires Node.js 16.20.2+ (updated from 6.4). The `.nvmrc` file will ensure the correct version is used.
- **Native Dependencies**: PostgreSQL (`pg`) and other native modules have been updated to versions with better M1 support.
- **Architecture Detection**: The build scripts now automatically detect your system architecture and build accordingly.

### Troubleshooting

If you encounter issues during installation or building:

1. **Native module compilation errors**: Ensure you have Xcode Command Line Tools installed
2. **Node version issues**: Make sure you're using the correct Node version with `nvm use`
3. **Electron issues**: Try removing `node_modules` and the package-lock.json, then reinstall
4. **Python/Conda issues**: M1 Macs may need Rosetta 2 for some legacy Python packages

[Contributing](https://github.com/yhat/rodeo/blob/master/contributing.md)
