
cask "sentry" do
  version "1.3"
  sha256 "9428dce0ddfe93b500a92b71719170228524091ac3c9cdfaa558363529b660c3"

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