class Uuid < Formula
  desc "Generate UUIDs straight to your clipboard"
  homepage "https://github.com/0xbenc/uuid"
  version "0.1.1"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/0xbenc/uuid/releases/download/v0.1.1/uuid_0.1.1_darwin_arm64.tar.gz"
      sha256 "3ee7a0eb0f6d271f6f5faf2db48bf102cbecb2bfbbd422e92c5b8feb72061dd6"
    else
      url "https://github.com/0xbenc/uuid/releases/download/v0.1.1/uuid_0.1.1_darwin_amd64.tar.gz"
      sha256 "52380f61ca2aef8d55aba80d9ed3b0eb2da41a4290f030e5adda09071a629f01"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/0xbenc/uuid/releases/download/v0.1.1/uuid_0.1.1_linux_arm64.tar.gz"
      sha256 "62a8cb9893e603c9e131c6500097a7796834963f4275f916385cfdaba5e88b9f"
    else
      url "https://github.com/0xbenc/uuid/releases/download/v0.1.1/uuid_0.1.1_linux_amd64.tar.gz"
      sha256 "f0405413a1f35c842cd5dc65cd96195142edfea7b8103dfa3c592d90bc00d0a5"
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
