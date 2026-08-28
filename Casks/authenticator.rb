cask "authenticator" do
  version "1.0.0"
  sha256 "0000000000000000000000000000000000000000000000000000000000000000"

  url "https://github.com/its-ash/authenticator/releases/download/v#{version}/Authenticator-#{version}.dmg"
  name "Authenticator"
  desc "Two-factor authentication code generator with biometric lock"
  homepage "https://github.com/its-ash/authenticator"

  livecheck do
    url :url
    strategy :github_latest
  end

  depends_on macos: ">= :catalina"

  app "Authenticator.app"

  zap trash: [
    "~/Library/Application Support/com.its-ash.authApp",
    "~/Library/Preferences/com.its-ash.authApp.plist",
    "~/Library/Caches/com.its-ash.authApp",
    "~/Library/HTTPStorages/com.its-ash.authApp",
    "~/Library/Saved Application State/com.its-ash.authApp.savedState",
  ]
end