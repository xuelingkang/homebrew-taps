home = ENV["HOME"]
cask "oracle-java8" do
  version "8u401,b10:4d245f941845490c91360409ecffb3b4"

  arch arm: "aarch64", intel: "x64"
  url "file://#{home}/Downloads/jdk-#{version.before_comma}-macosx-#{arch}.dmg"

  sha256 arm:   "a52331b9a88d0582e3dd24f950cab32a29390be024adbe5d557e25ae90d78d31",
         intel: "b7f30ff4607f4dff97538a6ad087107930b459d496645e0f40dbc1a735148f95"

  name "Oracle Java 8 Standard Edition Development Kit"
  homepage "https://www.oracle.com/technetwork/java/javase/overview/index.html"

  depends_on macos: ">= :el_capitan"

  pkg "JDK 8 Update 401.pkg"

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

