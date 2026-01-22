
cask "sentry" do
  version "1.2"
  sha256 "2ebca82dd9059af9cf0528ed344cf7e69b28746fb6c4a753a2acdc4b728d1dd0"

  url "https://github.com/monuk7735/sentry/releases/download/v#{version}/Sentry-v#{version}.dmg",
      verified: "github.com/monuk7735/sentry/"
  name "Sentry"
  desc "Secure your workflow without stopping it."
  homepage "https://monuk7735.github.io/sentry/"

  livecheck do
    url :url
    strategy :github_latest
  end

  depends_on macos: ">= :ventura"

  app "Sentry.app"

  zap trash: [
    "~/Library/Application Support/Sentry",
    "~/Library/Preferences/com.monuk7735.sentry.plist",
    "~/Library/Saved Application State/com.monuk7735.sentry.savedState"
  ]
end