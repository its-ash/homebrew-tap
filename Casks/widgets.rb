cask "widgets" do
  version "1.0.0"
  sha256 "633b993f5813a52d4e673690ac5ddf46493d4b065ef7a0acaa527b407f6fa4d5"

  url "https://github.com/its-ash/widgets/releases/download/v#{version}/Widgets-#{version}-macos.zip"
  name "Widgets"
  desc "Bento-style desktop widgets"
  homepage "https://github.com/its-ash/widgets"

  livecheck do
    url :url
    strategy :github_latest
  end

  depends_on macos: ">= :sequoia"

  app "Widgets.app"

  postflight do
    `xattr -cr /Applications/Widgets.app`
  end

  zap trash: [
    "~/Library/Application Support/MyMac",
    "~/Library/Preferences/in.itsash.mymac.plist",
    "~/Library/Caches/in.itsash.mymac",
    "~/Library/HTTPStorages/in.itsash.mymac",
    "~/Library/Saved Application State/in.itsash.mymac.savedState",
  ]
end
