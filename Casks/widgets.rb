cask "widgets" do
  version "2.0.0"
  sha256 "9add9f4aea491fb1417f9a1f9376b4683358fd9f7fb7858f154f1b4f50622252"

  url "https://github.com/its-ash/widgets/releases/download/v#{version}/Widgets-#{version}-macos.zip"
  name "Widgets"
  desc "Bento desktop widgets, sticky notes with AI, local AI router, and tools"
  homepage "https://widgets.itsash.in"

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
