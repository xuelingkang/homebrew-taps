cask "oracle-jdk-lts" do
  arch = Hardware::CPU.intel? ? "x64" : "aarch64"

  version "17.0.6"

  if Hardware::CPU.intel?
    sha256 "84768fff2ac49e967aca4c704a1e950b6395cbb29bc0cc1580f083e243017ee9"
  else
    sha256 "dd353e9fff5702728584d92c5bfc60414434abe40e4be4960d8ae3e8e8b08e00"
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

