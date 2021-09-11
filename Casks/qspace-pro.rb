cask "qspace-pro" do
  version "2.7.2"
  sha256 "86a008d16bd17e653531b73246ac488964ca5af9157bafa1191336bfb052432b"

  url "https://cdn.awehunt.com/qs/rel/QSpace%20Pro_V#{version}.dmg"

  name "QSpace Pro"
  name "QSpace 专业版"
  desc "A better Finder, it's well worth a try !"
  homepage "https://qspace.awehunt.com"

  depends_on macos: ">= :sierra"

  app "QSpace Pro.app"

  zap trash: [
    "~/Library/Application Support/com.jinghaoshe.qspace.pro",
    "~/Library/Application Scripts/com.jinghaoshe.qspace.pro.StashShelfShareExtension",
    "~/Library/Caches/com.jinghaoshe.qspace.pro",
    "~/Library/Containers/com.jinghaoshe.qspace.pro.StashShelfShareExtension",
    "~/Library/Preferences/com.jinghaoshe.qspace.pro.plist",
    "~/Library/Saved Application State/com.jinghaoshe.qspace.pro.savedState",
  ]
end
