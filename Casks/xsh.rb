cask "xsh" do
  version "0.1.6"
  sha256 "9955c50371e3b729f9f821c4f11cf8dccfae814c93b1f04ada4dc6788dd4bd6f"

  url "https://github.com/its-ash/xsh/releases/download/v#{version}/xsh-v#{version}-aarch64-apple-darwin.dmg"
  name "xsh"
  desc "AI-native terminal app and shell"
  homepage "https://tap.itsash.in/xsh/"

  livecheck do
    url :url
    strategy :github_latest
  end

  depends_on arch: :arm64
  depends_on macos: ">= :sonoma"

  app "xsh.app"
  binary "#{appdir}/xsh.app/Contents/MacOS/xsh"

  postflight do
    `xattr -cr /Applications/xsh.app`
  end

  zap trash: [
    "~/Library/Application Support/xsh",
    "~/Library/Caches/com.its-ash.xsh",
    "~/Library/HTTPStorages/com.its-ash.xsh",
    "~/Library/Preferences/com.its-ash.xsh.plist",
    "~/Library/Saved Application State/com.its-ash.xsh.savedState",
  ]
end
