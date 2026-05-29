class Ssherpa < Formula
  desc "Terminal UI for SSH config with supervised sessions"
  homepage "https://github.com/0xbenc/ssherpa"
  url "https://github.com/0xbenc/ssherpa/archive/refs/tags/v1.2.0.tar.gz"
  sha256 "ce7985c9badaf1bedcf443b066b033b4366e9f40452d5cd4b9e7200ce9275966"
  license "MIT"

  depends_on "go" => :build

  def install
    ldflags = %W[
      -s -w
      -X main.version=#{version}
      -X main.commit=homebrew
    ]

    system "go", "build", *std_go_args(ldflags: ldflags), "./cmd/ssherpa"
  end

  test do
    assert_match "ssherpa #{version}", shell_output("#{bin}/ssherpa version")
  end
end
