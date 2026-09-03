
cask "mew-notch" do
  version "2.2.2"
  sha256 "4af6dabf1bc78447b9403a4d4366f82fd57e1031cbcf3fcee1438d600d88ec47"

  url "https://github.com/monuk7735/mew-notch/releases/download/#{version}/MewNotch-#{version}.dmg",
      verified: "github.com/monuk7735/mew-notch/"
  name "MewNotch"
  desc "Transform that empty space into a powerful, dynamic dashboard. Control media, monitor system stats, and access files instantly"
  homepage "https://monuk7735.github.io/mew-notch/"

  livecheck do
    url :url
    strategy :github_latest
  end

  depends_on macos: :sonoma

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