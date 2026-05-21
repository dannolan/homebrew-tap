class Ga4Cli < Formula
  desc "Tiny, shippable Google Analytics 4 CLI"
  homepage "https://github.com/dannolan/ga4-cli"
  version "0.1.1"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/dannolan/ga4-cli/releases/download/v0.1.1/ga4_darwin_arm64.zip"
      sha256 "c327262e948e87027ae12e50d1c4653d07b1417dfb4cd8f6f81e95d9c2ef339c"
    else
      url "https://github.com/dannolan/ga4-cli/releases/download/v0.1.1/ga4_darwin_amd64.zip"
      sha256 "2722840ee1027b5bc161cca7070ab9d70d374a88829f68d41762e4a8960f389a"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/dannolan/ga4-cli/releases/download/v0.1.1/ga4_linux_arm64.zip"
      sha256 "4cf00233f5e35c10be3539e45353782b16a2e5d99112fcced6c74b518576514f"
    else
      url "https://github.com/dannolan/ga4-cli/releases/download/v0.1.1/ga4_linux_amd64.zip"
      sha256 "15f745725deb995813fe78c48230c957081d577742170779b0c6bc27bbc112f6"
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
