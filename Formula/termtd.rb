class Termtd < Formula
  desc "Terminal tower defense: hold a dying dragon's lair"
  homepage "https://github.com/0xbenc/termtd"
  version "1.4.2"
  license "MIT"

  on_macos do
    depends_on macos: :monterey
    if Hardware::CPU.arm?
      url "https://github.com/0xbenc/termtd/releases/download/v1.4.2/termtd_1.4.2_darwin_arm64.tar.gz"
      sha256 "1602c47dabb45420fac4c8b56849d185b95027fe1ebfd32e93ac1a222d9c93fa"
    else
      url "https://github.com/0xbenc/termtd/releases/download/v1.4.2/termtd_1.4.2_darwin_amd64.tar.gz"
      sha256 "7e89b146d98a99a10248b2f0e197bf05d2c9d66e33487540ca0367ced7b9d892"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/0xbenc/termtd/releases/download/v1.4.2/termtd_1.4.2_linux_arm64.tar.gz"
      sha256 "0c5fcb793817a78020975fa15cfdfa18df2c064fdb778dc9b24991a774134843"
    else
      url "https://github.com/0xbenc/termtd/releases/download/v1.4.2/termtd_1.4.2_linux_amd64.tar.gz"
      sha256 "f2a2dceb8c35178f0baeb467896e1e6625de323f46a6aa9bf7c2df89b1cc8c3a"
    end
  end

  def install
    bin.install "termtd"
  end

  test do
    assert_equal "termtd #{version}", shell_output("#{bin}/termtd --version").strip
    assert_match "hub", shell_output("#{bin}/termtd maps")
  end
end
