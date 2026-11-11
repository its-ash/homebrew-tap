cask "noteit" do
  version "1.0.0"
  sha256 "ede1a105f2add0f4dc078c0fd42a23f5137d4fee470ec5e39a2b84b3e50d85e1"

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
