class SeaBattle < Formula
  desc "Naval battles in your terminal, solo or with a friend"
  homepage "https://github.com/0xbenc/sea-battle-2"
  version "1.0.1"
  license "MIT"

  on_macos do
    depends_on macos: :monterey
    if Hardware::CPU.arm?
      url "https://github.com/0xbenc/sea-battle-2/releases/download/v1.0.1/sea-battle_1.0.1_darwin_arm64.tar.gz"
      sha256 "573c1f051b2c91723b2db1b3e600d7dfc1d376f73e6ee747c6f9e8ecea4e0996"
    else
      url "https://github.com/0xbenc/sea-battle-2/releases/download/v1.0.1/sea-battle_1.0.1_darwin_amd64.tar.gz"
      sha256 "69f0ba4b7735eb47fad380c36a03cc665af4f622e6e71e0f69fc6eb0b9047896"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/0xbenc/sea-battle-2/releases/download/v1.0.1/sea-battle_1.0.1_linux_arm64.tar.gz"
      sha256 "369c263e7fdc5f4f1ff848e6e3e5bbc0fd6486149cefcd040530a72620f5b230"
    else
      url "https://github.com/0xbenc/sea-battle-2/releases/download/v1.0.1/sea-battle_1.0.1_linux_amd64.tar.gz"
      sha256 "27c3548383b1d05739cae5285c19fac3b4f01d2b2a84093b6c79c4982457a492"
    end
  end

  def install
    bin.install "sea-battle"
  end

  test do
    assert_equal "sea-battle #{version}", shell_output("#{bin}/sea-battle --version").strip
    assert_match "arrival", shell_output("#{bin}/sea-battle --list")
  end
end
