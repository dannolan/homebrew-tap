class AppleAdsCli < Formula
  desc "Agent-first CLI for Apple Ads"
  homepage "https://github.com/dannolan/apple-ads-cli"
  version "0.1.4"
  license "MIT"

  depends_on :macos

  if Hardware::CPU.arm?
    url "https://github.com/dannolan/apple-ads-cli/releases/download/v0.1.4/ads_darwin_arm64.zip"
    sha256 "75b84532b673687086768ca7ad29fc2ccec5eb01485a6830f45a8a38f8d94dbd"
  else
    url "https://github.com/dannolan/apple-ads-cli/releases/download/v0.1.4/ads_darwin_amd64.zip"
    sha256 "b443369bf0cd53021bb1482bc9044d03545403601ed236ba118e8a21776a8e65"
  end

  def install
    bin.install "ads"
  end

  test do
    assert_match "Apple Ads", shell_output("#{bin}/ads --help")
    assert_match version.to_s, shell_output("#{bin}/ads version --json")
  end
end
