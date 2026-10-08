cask "mew-notch" do
  version "2.2.3"
  sha256 "7d47a40a822f3f1aa1ec579b78af3e502dba7338b33f5f632d958efc1439b6ef"

  url "https://github.com/monuk7735/mew-notch/releases/download/#{version}/MewNotch-#{version}.dmg",
      verified: "github.com/monuk7735/mew-notch/"
  name "MewNotch"
  desc "Transform your MacBook notch into a dynamic dashboard and media HUD"
  homepage "https://monuk7735.github.io/mew-notch/"

  livecheck do
    url :url
    strategy :github_latest
  end

  depends_on macos: :sonoma

  app "MewNotch.app"

  postflight_steps do
    run "/usr/bin/xattr", args: ["-cr", "{{appdir}}/MewNotch.app"]
  end

  zap trash: [
    "~/Library/Application Support/MewNotch",
    "~/Library/Preferences/com.monuk7735.mew-notch.plist",
    "~/Library/Saved Application State/com.monuk7735.mew-notch.savedState",
  ]
end
