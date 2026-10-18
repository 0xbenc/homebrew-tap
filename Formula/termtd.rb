class Termtd < Formula
  desc "Terminal tower defense: hold a dying dragon's lair"
  homepage "https://github.com/0xbenc/termtd"
  version "1.4.4"
  license "MIT"

  on_macos do
    depends_on macos: :monterey
    if Hardware::CPU.arm?
      url "https://github.com/0xbenc/termtd/releases/download/v1.4.4/termtd_1.4.4_darwin_arm64.tar.gz"
      sha256 "8abcda0046ee7c96cc7331fa2616bdf8b254cdb1c0a826fca6b6b330737bdc8b"
    else
      url "https://github.com/0xbenc/termtd/releases/download/v1.4.4/termtd_1.4.4_darwin_amd64.tar.gz"
      sha256 "367db4803de5a6c685fcaa25567be20f2bbb24943ed60ac87243b2e1ac11d2b5"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/0xbenc/termtd/releases/download/v1.4.4/termtd_1.4.4_linux_arm64.tar.gz"
      sha256 "615a5f67037a19990aa87be17e6f99c26153ec3c192efd7e952368afdf976ec6"
    else
      url "https://github.com/0xbenc/termtd/releases/download/v1.4.4/termtd_1.4.4_linux_amd64.tar.gz"
      sha256 "746e6f3cc70d0591704cf9c1e6a58ab7d1a02a271604000b7d4cd96622f06741"
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
