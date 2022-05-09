cask "oracle-jdk-lts" do
  arch = Hardware::CPU.intel? ? "x64" : "aarch64"

  version "17.0.3.1"

  if Hardware::CPU.intel?
    sha256 "4a3692cd015ec8a3037934baa1234bbfbcdfafd615c15b4d09e7a29832322e9a"
  else
    sha256 "57d674c777bb7c839efd58a9e1b5e1aba2f39adc2a64ad8916c48f08fdbaff43"
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
