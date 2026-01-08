
cask "sentry" do
  version "1.1"
  sha256 "f00e5083ac80f823841b1f7c62b78d606a0545206163fd2d47dd86d0e3619571"

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