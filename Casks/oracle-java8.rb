home = ENV["HOME"]
cask "oracle-java8" do
  version "8u411,b09:43d62d619be4e416215729597d70b8ac"

  arch arm: "aarch64", intel: "x64"
  url "file://#{home}/Downloads/jdk-#{version.before_comma}-macosx-#{arch}.dmg"

  sha256 arm:   "23900b0501f350637d8f826a62ff7806cd787a05c75141638b114891c33dd110",
         intel: "8bb1e9362891c4361d9aecd79f04b3eec7a2b07e95efb0f385fb29d94d40a7ce"

  name "Oracle Java 8 Standard Edition Development Kit"
  homepage "https://www.oracle.com/technetwork/java/javase/overview/index.html"

  depends_on macos: ">= :el_capitan"

  pkg "JDK 8 Update 411.pkg"

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

