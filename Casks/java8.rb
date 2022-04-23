home = ENV["HOME"]
cask 'java8' do
  version '8u331,b09:165374ff4ea84ef0bbd821706e29b123'
  sha256 'de88bde2d1453d7323638a05199408f7293ec50ad9dc015e3aebae3fab0a976e'
  url "file://#{home}/Downloads/jdk-#{version.before_comma}-macosx-x64.dmg"
  name 'Oracle Java 8 Standard Edition Development Kit'
  homepage 'https://www.oracle.com/technetwork/java/javase/overview/index.html'

  depends_on macos: '>= :yosemite'

  pkg 'JDK 8 Update 331.pkg'

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

