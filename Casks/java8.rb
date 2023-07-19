home = ENV["HOME"]
cask 'java8' do
  version '8u381,b09:8c876547113c4e4aab3c868e9e0ec572'

  if Hardware::CPU.intel?
    sha256 "036feba4f26bbb5e7a6e8f29f565a5f3bb47d9199ef7af7f06fc13244f2bfb6a"
    url "file://#{home}/Downloads/jdk-#{version.before_comma}-macosx-x64.dmg"
  else
    sha256 "236ddcd225bede9ae5257e3c85edb7270584ea8e7a40bf612f4a88015cbf234d"
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

