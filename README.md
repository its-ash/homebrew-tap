# shurutech Homebrew Tap

Homebrew Casks for shurutech macOS applications.

## Usage

```bash
brew tap its-ash/tap
brew install --cask authenticator
```

## Available Casks

| Cask | Description |
| --- | --- |
| [authenticator](Casks/authenticator.rb) | Two-factor authentication code generator with biometric lock |

## Updating a Cask

```bash
# Bump version + sha256 after a new release
shasum -a 256 Authenticator-1.0.0.dmg
# Edit Casks/<name>.rb with the new version and sha256
brew style Casks/<name>.rb
brew audit --cask <name>
brew install --cask <name>
```