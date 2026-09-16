class Uuid < Formula
  desc "Generate UUIDs straight to your clipboard"
  homepage "https://github.com/0xbenc/uuid"
  version "0.1.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/0xbenc/uuid/releases/download/v0.1.0/uuid_0.1.0_darwin_arm64.tar.gz"
      sha256 "1deaebc1d3bfb1a59f9d013c5e92bdd6196e8b14f6d0e748274ec9809c1eceda"
    else
      url "https://github.com/0xbenc/uuid/releases/download/v0.1.0/uuid_0.1.0_darwin_amd64.tar.gz"
      sha256 "fac65b76357d882a28f21fad8dfd3c466c1f8b68552f8b67ef30ef64f123a8c3"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/0xbenc/uuid/releases/download/v0.1.0/uuid_0.1.0_linux_arm64.tar.gz"
      sha256 "dd27f1fd4e467863c375be72f59febd5144896f2d853b4dff57f8b9e67c21a7f"
    else
      url "https://github.com/0xbenc/uuid/releases/download/v0.1.0/uuid_0.1.0_linux_amd64.tar.gz"
      sha256 "326520d3224c63ff2bd193ce917d701eca33b60a30b95d027bb4d35919983cb5"
    end
  end

  def install
    bin.install "uuid"
  end

  test do
    assert_equal "2ed6657d-e927-568b-95e1-2665a8aea6a2",
      shell_output("#{bin}/uuid -no-copy -v 5 -ns dns -name www.example.com").strip
  end
end
