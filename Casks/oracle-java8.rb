home = ENV["HOME"]
cask 'oracle-java8' do
  version '8u381,b09:8c876547113c4e4aab3c868e9e0ec572'

  if Hardware::CPU.intel?
    sha256 "c3447081763bb06dc16beadcbc2bf027a79e8dc5043673e2ca296b96e0f55d89"
    url "file://#{home}/Downloads/jdk-#{version.before_comma}-macosx-x64.dmg"
  else
    sha256 "d13a2c4b4fe135e59bc25df67ee04ec3ad72888fd66add4a54403f11372eca03"
    url "file://#{home}/Downloads/jdk-#{version.before_comma}-macosx-aarch64.dmg"
  end

  name 'Oracle Java 8 Standard Edition Development Kit'
  homepage 'https://www.oracle.com/technetwork/java/javase/overview/index.html'

  depends_on macos: '>= :el_capitan'

  pkg 'JDK 8 Update 381.pkg'

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

