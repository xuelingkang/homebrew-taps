cask "oracle-jdk-lts" do
  arch = Hardware::CPU.intel? ? "x64" : "aarch64"

  version "17.0.4"

  if Hardware::CPU.intel?
    sha256 "976c9757fe06c367cc351b4abba7a5bdba877cee686dbd818f1365792e634e8b"
  else
    sha256 "c0c22c194fc79e65137a727e3dc68e487317d279778ab5e9a0c2faf8caaefd82"
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

