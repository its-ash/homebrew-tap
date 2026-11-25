# Ash Homebrew Tap

Homebrew Casks and landing pages for Ash's native macOS apps at [tap.itsash.in](https://tap.itsash.in/).

## Usage

```bash
# Add the tap (once)
brew tap its-ash/tap
# Trust the tap (once, for unsigned casks)
brew trust its-ash/tap

# Install Widgets + exempt from Gatekeeper
brew install --cask widgets
xattr -cr /Applications/Widgets.app

# Install Nodio + exempt from Gatekeeper
brew install --cask nodio
xattr -cr /Applications/Nodio.app

# Install Cleaner + exempt from Gatekeeper
brew install --cask cleaner
xattr -cr /Applications/Cleaner.app
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
