cask "router" do
  version "1.0.1"
  sha256 "96c8a6f57c570e6d6df4c8da669b21d61f386917a63e70020f17b11681a236cb"

  url "https://github.com/its-ash/router/releases/download/v#{version}/Router-#{version}-macos.zip"
  name "Router"
  desc "Native macOS AI routing client"
  homepage "https://github.com/its-ash/router"

  livecheck do
    url :url
    strategy :github_latest
  end

  depends_on macos: ">= :sequoia"

  app "Router.app"

  postflight do
    `xattr -cr /Applications/Router.app`
  end

  zap trash: [
    "~/Library/Application Support/in.itsash.router",
    "~/Library/Preferences/in.itsash.router.plist",
    "~/Library/Caches/in.itsash.router",
    "~/Library/HTTPStorages/in.itsash.router",
    "~/Library/Saved Application State/in.itsash.router.savedState",
  ]
end