home = ENV["HOME"]
cask 'java8' do
  version '8u341,b10:424b9da4b48848379167015dcc250d8d'
  sha256 '95c5f251c5c9e717d1b9157e4f616e18b2657f57e4af258cc6d04c14c4bbe4e6'
  url "file://#{home}/Downloads/jdk-#{version.before_comma}-macosx-x64.dmg"
  name 'Oracle Java 8 Standard Edition Development Kit'
  homepage 'https://www.oracle.com/technetwork/java/javase/overview/index.html'

  depends_on macos: '>= :el_capitan'

  pkg 'JDK 8 Update 341.pkg'

  uninstall pkgutil: "com.oracle.jdk#{version.before_comma}",
            delete:  [
                       '/Library/Internet\ Plug-Ins/JavaAppletPlugin.plugin',
                       '/Library/PreferencePanes/JavaControlPanel.prefPane',
                     ]

  zap trash: [
               '~/Library/Application Support/Oracle/Java',
               '~/Library/Application Support/com.oracle.java.JavaAppletPlugin.plist',
               '~/Library/Application Support/com.oracle.javadeployment.plist',
             ]

  caveats do
    license 'https://www.oracle.com/technetwork/java/javase/terms/license/javase-license.html'
  end
end

