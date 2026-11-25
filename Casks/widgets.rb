cask "widgets" do
  version "2.0.1"
  sha256 "ce87522d97e6d1d185c2038d138de00b9dd646179c8388d12fcdb444bdbfc994"

  url "https://github.com/its-ash/homebrew-tap/releases/download/widgets-v#{version}/Widgets-#{version}-macos.zip"
  name "Widgets"
  desc "Bento desktop widgets, sticky notes with AI, local AI router, and tools"
  homepage "https://tap.itsash.in/widgets/"

  livecheck do
    url "https://github.com/its-ash/homebrew-tap/releases"
    regex(/^widgets-v(\d+(?:\.\d+)+)$/i)
  end

  depends_on macos: ">= :sequoia"

  app "Widgets.app"

  postflight do
    `xattr -cr /Applications/Widgets.app`
  end

  zap trash: [
    "~/Library/Application Support/MyMac",
    "~/Library/Caches/in.itsash.mymac",
    "~/Library/HTTPStorages/in.itsash.mymac",
    "~/Library/Preferences/in.itsash.mymac.plist",
    "~/Library/Saved Application State/in.itsash.mymac.savedState",
  ]
end
