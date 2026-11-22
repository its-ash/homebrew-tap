cask "cleaner" do
  version "0.2.0"
  sha256 "4e5efdee05bf65b64208fffadae4ab36cfbd1c145c7472330c9e76f1d51e6188"

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
