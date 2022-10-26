cask "oracle-jdk-lts" do
  arch = Hardware::CPU.intel? ? "x64" : "aarch64"

  version "17.0.5"

  if Hardware::CPU.intel?
    sha256 "0dcea5aab0ea8ca2810a114f5fab5c145c9bc0af97462fe0016ddd397aff7016"
  else
    sha256 "d8287683dc363640695498d470907923292a75ee453ef46be3b25a1a2fef148a"
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

