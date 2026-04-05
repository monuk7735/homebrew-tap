
cask "mew-notch" do
  version "2.2.1"
  sha256 "ebbc21cbbf4acf84c9b4871a76a3a660911a2a82b80e22f081c24c87a297f689"

  url "https://github.com/monuk7735/mew-notch/releases/download/#{version}/MewNotch-#{version}.dmg",
      verified: "github.com/monuk7735/mew-notch/"
  name "MewNotch"
  desc "Transform that empty space into a powerful, dynamic dashboard. Control media, monitor system stats, and access files instantly"
  homepage "https://monuk7735.github.io/mew-notch/"

  livecheck do
    url :url
    strategy :github_latest
  end

  depends_on macos: ">= :sonoma"

  app "MewNotch.app"

  postflight do
    system_command "xattr", args: ["-cr", "#{appdir}/MewNotch.app"]
  end

  zap trash: [
    "~/Library/Application Support/MewNotch",
    "~/Library/Preferences/com.monuk7735.mew-notch.plist",
    "~/Library/Saved Application State/com.monuk7735.mew-notch.savedState"
  ]
end