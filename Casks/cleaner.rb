cask "cleaner" do
  version "0.2.1"
  sha256 "f42d3a0e6b5ba74b4dd90ca89146785496f39206cc0de42c6f0113bfef103299"

  url "https://github.com/its-ash/cleaner/releases/download/v#{version}/Cleaner-#{version}-macos.zip"
  name "Cleaner"
  desc "Find and delete build artifacts, dependency folders and caches"
  homepage "https://github.com/its-ash/cleaner"

  livecheck do
    url :url
    strategy :github_latest
  end

  depends_on macos: ">= :sonoma"

  app "Cleaner.app"

  postflight do
    `xattr -cr /Applications/Cleaner.app`
  end

  zap trash: [
    "~/Library/Application Support/Cleaner",
    "~/Library/Preferences/dev.cleaner.app.plist",
    "~/Library/Caches/dev.cleaner.app",
    "~/Library/HTTPStorages/dev.cleaner.app",
    "~/Library/Saved Application State/dev.cleaner.app.savedState",
  ]
end
