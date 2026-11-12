cask "noteit" do
  version "1.0.1"
  sha256 "83c48eabefc3b9c8d459bab6caa29a50d3ecc5f1dab943df07d31677c07479c4"

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
