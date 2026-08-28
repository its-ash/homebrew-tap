cask "authenticator" do
  version "1.0.0"
  sha256 "0000000000000000000000000000000000000000000000000000000000000000"

  url "https://github.com/shurutech/authenticator/releases/download/v#{version}/Authenticator-#{version}.dmg"
  name "Authenticator"
  desc "Two-factor authentication code generator with biometric lock"
  homepage "https://github.com/shurutech/authenticator"

  livecheck do
    url :url
    strategy :github_latest
  end

  depends_on macos: ">= :catalina"

  app "Authenticator.app"

  zap trash: [
    "~/Library/Application Support/com.shurutech.authApp",
    "~/Library/Preferences/com.shurutech.authApp.plist",
    "~/Library/Caches/com.shurutech.authApp",
    "~/Library/HTTPStorages/com.shurutech.authApp",
    "~/Library/Saved Application State/com.shurutech.authApp.savedState",
  ]
end