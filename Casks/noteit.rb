cask "noteit" do
  version "1.0.2"
  sha256 "4091063c5d1bdd213f73820bdc04d66a3bbbff12f08b8c331afb46c6e8962471"

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
