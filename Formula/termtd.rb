class Termtd < Formula
  desc "Terminal tower defense: hold a dying dragon's lair"
  homepage "https://github.com/0xbenc/termtd"
  version "1.2.0"
  license "MIT"

  on_macos do
    depends_on macos: :monterey
    if Hardware::CPU.arm?
      url "https://github.com/0xbenc/termtd/releases/download/v1.2.0/termtd_1.2.0_darwin_arm64.tar.gz"
      sha256 "b71339e9f51a529a4d4af828bddc476a1980e7fe818d41c3ba68206b37294026"
    else
      url "https://github.com/0xbenc/termtd/releases/download/v1.2.0/termtd_1.2.0_darwin_amd64.tar.gz"
      sha256 "9a977f59c39ff7ad4f0def573bbd07470d710a0fb5dad19f24883b0110190f93"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/0xbenc/termtd/releases/download/v1.2.0/termtd_1.2.0_linux_arm64.tar.gz"
      sha256 "9db3306c6b056546114bb17b4098243306d88c6d4efb95b8c34c676ba99fe8e6"
    else
      url "https://github.com/0xbenc/termtd/releases/download/v1.2.0/termtd_1.2.0_linux_amd64.tar.gz"
      sha256 "032a11cece0bcb13d392c8608ac2b4c7337512b44929d79e3ba66ba2a1f855da"
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
