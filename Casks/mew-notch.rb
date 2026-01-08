
cask "mew-notch" do
  version "2.0.1"
  sha256 "f68fd9ef845634fcbf98f4914f0150fceb0569d880470bd01fcc1a408dee8b0a"

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

  zap trash: [
    "~/Library/Application Support/MewNotch",
    "~/Library/Preferences/com.monuk7735.mew-notch.plist",
    "~/Library/Saved Application State/com.monuk7735.mew-notch.savedState"
  ]
end