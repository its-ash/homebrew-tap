cask "noteit" do
  version "1.0.3"
  sha256 "8dd1707f979ab41d94bc1b73a544b2aecd13e85e899cfc3aa863401cd01977bd"

  url "https://github.com/its-ash/noteit/releases/download/v#{version}/NoteIt-#{version}-macos.zip"
  name "NoteIt"
  desc "Sticky notes with AI refine"
  homepage "https://github.com/its-ash/noteit"

  livecheck do
    url :url
    strategy :github_latest
  end

  depends_on macos: ">= :sequoia"

  app "NoteIt.app"

  postflight do
    `xattr -cr /Applications/NoteIt.app`
  end

  zap trash: [
    "~/Library/Application Support/NoteIt",
    "~/Library/Preferences/in.itsash.noteit.plist",
    "~/Library/Caches/in.itsash.noteit",
    "~/Library/HTTPStorages/in.itsash.noteit",
    "~/Library/Saved Application State/in.itsash.noteit.savedState",
  ]
end
