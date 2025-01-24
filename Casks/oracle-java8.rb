home = ENV["HOME"]
cask "oracle-java8" do
  version "8u441"

  arch arm: "aarch64", intel: "x64"
  url "file://#{home}/Downloads/jdk-#{version}-macosx-#{arch}.dmg"

  sha256 :no_check

  name "Oracle Java 8 Standard Edition Development Kit"
  homepage "https://www.oracle.com/technetwork/java/javase/overview/index.html"

  depends_on macos: ">= :el_capitan"

  pkg "JDK 8 Update 441.pkg"

  uninstall pkgutil: "com.oracle.jdk#{version}",
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

