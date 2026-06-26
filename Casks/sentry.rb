
cask "sentry" do
  version "1.6"
  sha256 "b3612614ec1df14b60c7e0d1cd6dacbf7150d331365e46cc7c8a5145e305c5cd"

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
  binary "#{appdir}/Sentry.app/Contents/Resources/sentry-cli"

  postflight do
    system_command "xattr", args: ["-cr", "#{appdir}/Sentry.app"]
  end

  zap trash: [
    "~/Library/Application Support/Sentry",
    "~/Library/Preferences/com.monuk7735.sentry.plist",
    "~/Library/Saved Application State/com.monuk7735.sentry.savedState"
  ]
end