cask "nodio" do
  version "1.0.0"
  sha256 ""

  url "https://github.com/its-ash/Nodio/releases/download/v#{version}/Nodio.dmg"
  name "Nodio"
  desc "Voice to text, on your Mac"
  homepage "https://github.com/its-ash/Nodio"

  livecheck do
    url :url
    strategy :github_latest
  end

  depends_on macos: ">= :ventura"

  app "Nodio.app"

  postflight do
    `xattr -cr /Applications/Nodio.app`
  end

  zap trash: [
    "~/Library/Application Support/com.nodio.app",
    "~/Library/Preferences/com.nodio.app.plist",
    "~/Library/Caches/com.nodio.app",
    "~/Library/HTTPStorages/com.nodio.app",
    "~/Library/Saved Application State/com.nodio.app.savedState",
    "~/Library/Logs/DiagnosticReports/Nodio-*.ips",
  ]
end