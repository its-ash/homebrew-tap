cask "authenticator" do
  version "1.0.3"
  sha256 "cf8d16f81bc8754994646c06d767a4200a7920a5e59a7a814c23d66fcde9f46c"

  url "https://github.com/its-ash/authenticator/releases/download/v#{version}/Authenticator-#{version}-macos.zip"
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
    "~/Library/Application Support/in.itsash.authApp",
    "~/Library/Preferences/in.itsash.authApp.plist",
    "~/Library/Caches/in.itsash.authApp",
    "~/Library/HTTPStorages/in.itsash.authApp",
    "~/Library/Saved Application State/in.itsash.authApp.savedState",
  ]
end