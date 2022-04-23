cask "oracle-jdk-lts" do
  arch = Hardware::CPU.intel? ? "x64" : "aarch64"

  version "17.0.3"

  if Hardware::CPU.intel?
    sha256 "70ef4f389ed5e33dca27ce6e97db683dbcadc7578483f9392f61be826de195d7"
  else
    sha256 "cf8d881186737f14d5efc80c4c09cd1bf349ca65c0362a9366e9fe93bd3c4323"
  end

  url "https://download.oracle.com/java/#{version.major}/archive/jdk-#{version}_macos-#{arch}_bin.dmg"
  name "Oracle Java Standard Edition Development Kit"
  desc "JDK from Oracle"
  homepage "https://www.oracle.com/java/technologies/downloads/"

  livecheck do
    url "https://www.oracle.com/java/technologies/javase/#{version.major}u-relnotes.html"
    regex(/<li>\s*JDK\s*v?(\d+(?:\.\d+)*)/i)
  end

  depends_on macos: ">= :mojave"

  pkg "JDK #{version}.pkg"

  uninstall pkgutil: "com.oracle.jdk-#{version}"

  caveats do
    license "https://www.oracle.com/downloads/licenses/no-fee-license.html"
  end
end
