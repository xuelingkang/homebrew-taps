cask "qspace-pro" do
  version "2.9.14"
  sha256 "184fce2ae0fd52cce829a3351970f9b16606561b9380ce1f423bd98c78c24bb3"

  url "https://cdn.awehunt.com/qs/rel/QSpace%20Pro_V#{version}.dmg"

  name "QSpace Pro"
  name "QSpace 专业版"
  desc "A better Finder, more flexible and has rich features!"
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
