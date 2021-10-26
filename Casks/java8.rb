home = ENV["HOME"]
cask 'java8' do
  version '8u311,b11:4d5417147a92418ea8b615e228bb6935'
  sha256 '90ab67fb01712ea1b223ab7c10c7dbb0ed8028d9716aad954d9703969400b6e5'
  url "file://#{home}/Downloads/jdk-#{version.before_comma}-macosx-x64.dmg"
  name 'Oracle Java 8 Standard Edition Development Kit'
  homepage 'https://www.oracle.com/technetwork/java/javase/overview/index.html'

  depends_on macos: '>= :yosemite'

  pkg 'JDK 8 Update 311.pkg'

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

