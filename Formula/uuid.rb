class Uuid < Formula
  desc "Generate UUIDs straight to your clipboard"
  homepage "https://github.com/0xbenc/uuid"
  version "0.1.2"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/0xbenc/uuid/releases/download/v0.1.2/uuid_0.1.2_darwin_arm64.tar.gz"
      sha256 "deb0a7274ceddf26b18db763ced181eab5ff6d1859f481617b3f592499a4805c"
    else
      url "https://github.com/0xbenc/uuid/releases/download/v0.1.2/uuid_0.1.2_darwin_amd64.tar.gz"
      sha256 "02c9d610114ec862fdd9e0c14d5b40a573561ea9e74700b10bedf9b6abe8d4fa"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/0xbenc/uuid/releases/download/v0.1.2/uuid_0.1.2_linux_arm64.tar.gz"
      sha256 "36ef67273012f8521eecab6a5cbd9e8cabe7dbca0867fead2f47fedd33c09f42"
    else
      url "https://github.com/0xbenc/uuid/releases/download/v0.1.2/uuid_0.1.2_linux_amd64.tar.gz"
      sha256 "f2dd774a26d535c4a2173e7f47b85348f2f013ccac4b17fe6a338e4cd11ac2e2"
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
