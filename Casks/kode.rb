cask "kode" do
  version "1.0.0"
  sha256 ""

  url "https://github.com/its-ash/kode/releases/download/v#{version}/Kode-#{version}-macos.zip"
  name "Kode"
  desc "Native macOS coding agent powered by Router"
  homepage "https://github.com/its-ash/kode"

  livecheck do
    url :url
    strategy :github_latest
  end

  depends_on macos: ">= :sequoia"

  app "Kode.app"

  postflight do
    `xattr -cr /Applications/Kode.app`
  end

  zap trash: [
    "~/Library/Application Support/Kode",
    "~/Library/Preferences/in.itsash.kode.plist",
    "~/Library/Caches/in.itsash.kode",
    "~/Library/HTTPStorages/in.itsash.kode",
    "~/Library/Saved Application State/in.itsash.kode.savedState",
  ]
end
