class Tdef < Formula
  desc "Terminal tower defense: hold a dying dragon's lair"
  homepage "https://github.com/0xbenc/tdef"
  version "1.0.0"
  license "MIT"

  on_macos do
    depends_on macos: :monterey
    if Hardware::CPU.arm?
      url "https://github.com/0xbenc/tdef/releases/download/v1.0.0/tdef_1.0.0_darwin_arm64.tar.gz"
      sha256 "e2dea473cd4104e1ade5337d942381e0ba781f54a50a6a4abd0c7debd402af7a"
    else
      url "https://github.com/0xbenc/tdef/releases/download/v1.0.0/tdef_1.0.0_darwin_amd64.tar.gz"
      sha256 "2b8b493d1dcbd30d38ee29879d22a29f8774954d348bd20c0408cead290c767c"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/0xbenc/tdef/releases/download/v1.0.0/tdef_1.0.0_linux_arm64.tar.gz"
      sha256 "0a2d47ab6c86eb926308e82846eb9bf19b8142ca262f3beea300c05a62c660a4"
    else
      url "https://github.com/0xbenc/tdef/releases/download/v1.0.0/tdef_1.0.0_linux_amd64.tar.gz"
      sha256 "90c45971ff66e905caee95cfa18aba610bfd2723d658c606e4e4db317af90f84"
    end
  end

  def install
    bin.install "tdef"
  end

  test do
    assert_equal "tdef #{version}", shell_output("#{bin}/tdef --version").strip
    assert_match "hub", shell_output("#{bin}/tdef maps")
  end
end
