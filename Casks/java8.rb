home = ENV["HOME"]
cask 'java8' do
  version '8u361,b09:0ae14417abb444ebb02b9815e2103550'
  sha256 '34fda35f876d33edc0f9006d0a9c5bb45a3e42640053e0b2327ad6fb8dc249a7'
  url "file://#{home}/Downloads/jdk-#{version.before_comma}-macosx-x64.dmg"
  name 'Oracle Java 8 Standard Edition Development Kit'
  homepage 'https://www.oracle.com/technetwork/java/javase/overview/index.html'

  depends_on macos: '>= :el_capitan'

  pkg 'JDK 8 Update 361.pkg'

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

