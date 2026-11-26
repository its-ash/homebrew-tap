cask "cleaner" do
  version "0.2.2"
  sha256 "88409336bbb634a83d31817bb2e992a5c8242bb1181cc90ebc385aaaf07a0215"

  url "https://github.com/its-ash/cleaner/releases/download/v#{version}/Cleaner-#{version}-macos.zip"
  name "Cleaner"
  desc "Find and delete build artifacts, dependency folders and caches"
  homepage "https://tap.itsash.in/cleaner/"

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
