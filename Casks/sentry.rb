cask "sentry" do
  version "2.0"
  sha256 "8bd49020b51c8148c4391d62ee6221bfb5a7f0cb128bd4a38d83bbdd7d37c827"

  url "https://github.com/monuk7735/sentry/releases/download/v#{version}/Sentry-v#{version}.dmg",
      verified: "github.com/monuk7735/sentry/"
  name "Sentry"
  desc "Secure your workflow without stopping it"
  homepage "https://monuk7735.github.io/sentry/"

  livecheck do
    url :url
    strategy :github_latest
  end

  depends_on macos: :ventura

  app "Sentry.app"
  binary "#{appdir}/Sentry.app/Contents/Resources/sentry-cli"

  postflight do
    system_command "xattr", args: ["-cr", "#{appdir}/Sentry.app"]
  end

  zap trash: [
    "~/Library/Application Support/Sentry",
    "~/Library/Preferences/com.monuk7735.sentry.plist",
    "~/Library/Saved Application State/com.monuk7735.sentry.savedState",
  ]
end
