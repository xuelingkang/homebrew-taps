cask "qspace-pro" do
  version "2.9.10"
  sha256 "028f5e8e8516008e192fb0833fdc3346b6e813d6b71b821417d4a7a3d8e6bccd"

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
