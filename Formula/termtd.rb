class Termtd < Formula
  desc "Terminal tower defense: hold a dying dragon's lair"
  homepage "https://github.com/0xbenc/termtd"
  version "1.3.0"
  license "MIT"

  on_macos do
    depends_on macos: :monterey
    if Hardware::CPU.arm?
      url "https://github.com/0xbenc/termtd/releases/download/v1.3.0/termtd_1.3.0_darwin_arm64.tar.gz"
      sha256 "7229a860fa06a5868634f50a04561cf4f088181f7700619bb8495eacef372eca"
    else
      url "https://github.com/0xbenc/termtd/releases/download/v1.3.0/termtd_1.3.0_darwin_amd64.tar.gz"
      sha256 "9fb8c82f6245aea8dd1d98725eb173715b69bb1bfcf8f6807ac2262db75ea9f7"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/0xbenc/termtd/releases/download/v1.3.0/termtd_1.3.0_linux_arm64.tar.gz"
      sha256 "8a1e8f78d1f0892d412e87c1a098631047c0b964875153b1bc533375ed6b15f3"
    else
      url "https://github.com/0xbenc/termtd/releases/download/v1.3.0/termtd_1.3.0_linux_amd64.tar.gz"
      sha256 "7e17ccc4ffccc2a28929dda2f7a3d10f9f6286348a7adcae0228c2c49732195a"
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
