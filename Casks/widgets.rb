cask "widgets" do
  version "1.0.1"
  sha256 "21c15b171f80780d5196414b3bab5f9c8c4a95e6cf5174ead75462778c1454ce"

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
