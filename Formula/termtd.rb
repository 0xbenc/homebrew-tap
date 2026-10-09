class Termtd < Formula
  desc "Terminal tower defense: hold a dying dragon's lair"
  homepage "https://github.com/0xbenc/termtd"
  version "1.4.1"
  license "MIT"

  on_macos do
    depends_on macos: :monterey
    if Hardware::CPU.arm?
      url "https://github.com/0xbenc/termtd/releases/download/v1.4.1/termtd_1.4.1_darwin_arm64.tar.gz"
      sha256 "072761925f5b22f71d51fe1db8b163961221014c6809d420e7d2c8326b5c0554"
    else
      url "https://github.com/0xbenc/termtd/releases/download/v1.4.1/termtd_1.4.1_darwin_amd64.tar.gz"
      sha256 "e3e46457d42ea9e5bf730d6d937d61a14d1592bfdb3a33d7e34c805acac915b1"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/0xbenc/termtd/releases/download/v1.4.1/termtd_1.4.1_linux_arm64.tar.gz"
      sha256 "f459bd559513cd9b02d0b1aaa4aca4d15232b3af90f8693ac4ee502229535a66"
    else
      url "https://github.com/0xbenc/termtd/releases/download/v1.4.1/termtd_1.4.1_linux_amd64.tar.gz"
      sha256 "9faafdcaa29c703265d9ced5544399e22b3a2b58af4c72f10ee27f81e8e94248"
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
