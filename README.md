# Ash Homebrew Tap

Homebrew Casks for Ash macOS applications.

## Usage

```bash
brew tap its-ash/tap
brew trust its-ash/tap
brew install --cask nodio
brew install --cask router
```

## Available Casks

| Cask | Description |
| --- | --- |
| [nodio](Casks/nodio.rb) | Voice to text, on your Mac |
| [router](Casks/router.rb) | Native macOS AI routing client |

## Updating a Cask

```bash
# Bump version + sha256 after a new release
shasum -a 256 Nodio.dmg
# Edit Casks/<name>.rb with the new version and sha256
brew style Casks/<name>.rb
brew audit --cask <name>
brew install --cask <name>
```