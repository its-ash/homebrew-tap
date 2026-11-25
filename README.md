# Ash Homebrew Tap

Homebrew Casks and landing pages for Ash's native macOS apps at [tap.itsash.in](https://tap.itsash.in/).

## Usage

```bash
brew tap its-ash/tap
brew trust its-ash/tap
brew install --cask widgets
brew install --cask nodio
brew install --cask cleaner
```

## Available Casks

| Cask | Page | Description |
| --- | --- | --- |
| [widgets](Casks/widgets.rb) | [tap.itsash.in/widgets](https://tap.itsash.in/widgets/) | Rainbow Bento desktop widgets, AI sticky notes, local AI router & tools |
| [nodio](Casks/nodio.rb) | [tap.itsash.in/nodio](https://tap.itsash.in/nodio/) | On-device Whisper voice to text for Mac |
| [cleaner](Casks/cleaner.rb) | [tap.itsash.in/cleaner](https://tap.itsash.in/cleaner/) | Find and delete build artifacts, dependency folders, and caches |

## Updating a Cask

```bash
scripts/release.sh widgets 2.0.0
brew style Casks/widgets.rb
brew audit --cask widgets
brew install --cask widgets
```
