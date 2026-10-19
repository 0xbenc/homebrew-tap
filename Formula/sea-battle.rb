class SeaBattle < Formula
  desc "Naval battles in your terminal, solo or with a friend"
  homepage "https://github.com/0xbenc/sea-battle-2"
  version "1.0.0"
  license "MIT"

  on_macos do
    depends_on macos: :monterey
    if Hardware::CPU.arm?
      url "https://github.com/0xbenc/sea-battle-2/releases/download/v1.0.0/sea-battle_1.0.0_darwin_arm64.tar.gz"
      sha256 "75c91e555cc8c4ca6c1658bc407223da790afcbbbc8330f3bf59851db80d315c"
    else
      url "https://github.com/0xbenc/sea-battle-2/releases/download/v1.0.0/sea-battle_1.0.0_darwin_amd64.tar.gz"
      sha256 "91d1d90a7ee98d6f1eac7649dc5d18cc9f054380520280308cb0786f9f965a6b"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/0xbenc/sea-battle-2/releases/download/v1.0.0/sea-battle_1.0.0_linux_arm64.tar.gz"
      sha256 "fde9c22e47e7b6eec2878b45ab11c8f7bec04280fd5f479dff636f7d9eb73ac0"
    else
      url "https://github.com/0xbenc/sea-battle-2/releases/download/v1.0.0/sea-battle_1.0.0_linux_amd64.tar.gz"
      sha256 "25cda13bcfa27ee9c672a6f27b9c04b6db4eb29d836dc33889ba5f9c936f41d7"
    end
  end

  def install
    bin.install "sea-battle"
  end

  test do
    assert_equal "sea-battle #{version}", shell_output("#{bin}/sea-battle --version").strip
    assert_match "arrival", shell_output("#{bin}/sea-battle --list")
  end
end
