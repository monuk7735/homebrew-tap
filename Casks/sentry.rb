
cask "sentry" do
  version "1.5"
  sha256 "a9d20c864aca1a9e528eb1c06a6c49cbc99f254889dfde4b35d4f68cc80a5a53"

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