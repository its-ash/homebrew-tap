cask "router" do
  version "1.0.0"
  sha256 "c10f54ea8b8eddf15ee3cfe2247011c63e9bc81c154607d1e7ec5fab1ca4e134"

  url "https://github.com/its-ash/router/releases/download/v#{version}/Router-#{version}-macos.zip"
  name "Router"
  desc "Native macOS AI routing client"
  homepage "https://github.com/its-ash/router"

  livecheck do
    url :url
    strategy :github_latest
  end

  depends_on macos: :catalina

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