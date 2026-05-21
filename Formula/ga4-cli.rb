class Ga4Cli < Formula
  desc "Tiny, shippable Google Analytics 4 CLI"
  homepage "https://github.com/dannolan/ga4-cli"
  version "0.1.3"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/dannolan/ga4-cli/releases/download/v0.1.3/ga4_darwin_arm64.zip"
      sha256 "2950834dbe23cc37e0a447e5ff9f2cb226fcc644f2cf25032d74bca58c8fc90c"
    else
      url "https://github.com/dannolan/ga4-cli/releases/download/v0.1.3/ga4_darwin_amd64.zip"
      sha256 "fc530d4da601cb6a4bf5b1ca7d5373b34d005dc7670e97919806583009ee9edd"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/dannolan/ga4-cli/releases/download/v0.1.3/ga4_linux_arm64.zip"
      sha256 "93f6c9100b8adde53ead37aa2bc06573a0a4f5ce411b34a07dcb8fb13561e5f1"
    else
      url "https://github.com/dannolan/ga4-cli/releases/download/v0.1.3/ga4_linux_amd64.zip"
      sha256 "eac3fab1b3b873b391a39d0ccbcb72a9bfbe18969e76f8bc10406550eb790429"
    end
  end

  def install
    bin.install "ga4"
  end

  test do
    assert_match "Google Analytics 4", shell_output("#{bin}/ga4 --help")
    assert_match version.to_s, shell_output("#{bin}/ga4 version --json")
    assert_match "ga4-cli", shell_output("#{bin}/ga4 manifest --json")
  end
end
