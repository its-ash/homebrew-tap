cask "widgets" do
  version "2.1.2"
  sha256 "fdb83575b523eb879965e4682d95ac8bed0a3cdef7f3eec2f8fd21c6ad8cf9c6"

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
