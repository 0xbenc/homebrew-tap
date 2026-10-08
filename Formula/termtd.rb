class Termtd < Formula
  desc "Terminal tower defense: hold a dying dragon's lair"
  homepage "https://github.com/0xbenc/termtd"
  version "1.4.0"
  license "MIT"

  on_macos do
    depends_on macos: :monterey
    if Hardware::CPU.arm?
      url "https://github.com/0xbenc/termtd/releases/download/v1.4.0/termtd_1.4.0_darwin_arm64.tar.gz"
      sha256 "f655a97fd313d5825a07cec10b1cae36909e421d15c9fa924e7a02fe3b0e9c69"
    else
      url "https://github.com/0xbenc/termtd/releases/download/v1.4.0/termtd_1.4.0_darwin_amd64.tar.gz"
      sha256 "91fa326ca79df160616fa4efcf74c4385375709cbe94c2649426392a7d5c7d1c"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/0xbenc/termtd/releases/download/v1.4.0/termtd_1.4.0_linux_arm64.tar.gz"
      sha256 "dc1c4faf21c88ed1013cf7a2695c937a3ea22810f2efe1bf1c63612fe98d90ef"
    else
      url "https://github.com/0xbenc/termtd/releases/download/v1.4.0/termtd_1.4.0_linux_amd64.tar.gz"
      sha256 "3da6b43f8837addd592dc2adab742eba42b7996651c44d217f05afecf3ec059b"
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
