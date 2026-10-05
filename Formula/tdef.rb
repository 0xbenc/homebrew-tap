class Tdef < Formula
  desc "Terminal tower defense: hold a dying dragon's lair"
  homepage "https://github.com/0xbenc/tdef"
  version "1.1.0"
  license "MIT"

  on_macos do
    depends_on macos: :monterey
    if Hardware::CPU.arm?
      url "https://github.com/0xbenc/tdef/releases/download/v1.1.0/tdef_1.1.0_darwin_arm64.tar.gz"
      sha256 "2caec9e7d6d79c9ca5cf5e1e176206ee260fc59af9f34bd9c54d01c78f22b9f3"
    else
      url "https://github.com/0xbenc/tdef/releases/download/v1.1.0/tdef_1.1.0_darwin_amd64.tar.gz"
      sha256 "947855f1c3d5cb8d8f7a7a8c58d3e3ae4a5ca023400afb58ed380057aa05b807"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/0xbenc/tdef/releases/download/v1.1.0/tdef_1.1.0_linux_arm64.tar.gz"
      sha256 "2224fc56d1553d52b2bcce5a91cb0d00c20e3117f4aece8a82ba49991235d65b"
    else
      url "https://github.com/0xbenc/tdef/releases/download/v1.1.0/tdef_1.1.0_linux_amd64.tar.gz"
      sha256 "1b753fea7d280508e4a65fed597fd62d26afb5c639f0583c4084810308799faf"
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
