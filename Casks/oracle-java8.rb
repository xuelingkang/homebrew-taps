home = ENV["HOME"]
cask "oracle-java8" do
  version "8u391,b13:b291ca3e0c8548b5a51d5a5f50063037"

  arch arm: "aarch64", intel: "x64"
  url "file://#{home}/Downloads/jdk-#{version.before_comma}-macosx-#{arch}.dmg"

  sha256 arm:   "b901a514c76c640973d503de2bb6b95cde830ae9681945efade64ea4f87a3906",
         intel: "720f5ee1bd1d95ac400dc2ee22ff8d4ab261ee1f09ad8e056b2938c8d6db8998"

  name "Oracle Java 8 Standard Edition Development Kit"
  homepage "https://www.oracle.com/technetwork/java/javase/overview/index.html"

  depends_on macos: ">= :el_capitan"

  pkg "JDK 8 Update 391.pkg"

  uninstall pkgutil: "com.oracle.jdk#{version.before_comma}",
            delete:  [
                       "/Library/Internet\ Plug-Ins/JavaAppletPlugin.plugin",
                       "/Library/PreferencePanes/JavaControlPanel.prefPane",
                     ]

  zap trash: [
               "~/Library/Application Support/Oracle/Java",
               "~/Library/Application Support/com.oracle.java.JavaAppletPlugin.plist",
               "~/Library/Application Support/com.oracle.javadeployment.plist",
             ]

  caveats do
    license "https://www.oracle.com/technetwork/java/javase/terms/license/javase-license.html"
  end
end

