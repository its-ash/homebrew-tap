# Ash Homebrew Tap

Homebrew Casks for Ash macOS applications.

## Usage

```bash
brew tap its-ash/tap
brew trust its-ash/tap
brew install --cask nodio
brew install --cask kode
brew install --cask widgets
brew install --cask cleaner
```

## Available Casks

| Cask | Description |
| --- | --- |
| [nodio](Casks/nodio.rb) | Voice to text, on your Mac |
| [kode](Casks/kode.rb) | Native macOS coding agent |
| [widgets](Casks/widgets.rb) | Bento desktop widgets, sticky notes with AI, local AI router, dev & utility tools |
| [cleaner](Casks/cleaner.rb) | Find and delete build artifacts, dependency folders and caches |

## Updating a Cask

```bash
# Bump version + sha256 after a new release
scripts/release.sh widgets 2.0.0
brew style Casks/widgets.rb
brew audit --cask widgets
brew install --cask widgets
```
