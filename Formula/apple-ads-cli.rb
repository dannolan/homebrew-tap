class AppleAdsCli < Formula
  desc "Agent-first CLI for Apple Ads"
  homepage "https://github.com/dannolan/apple-ads-cli"
  version "0.3.0"
  license "MIT"

  depends_on :macos

  if Hardware::CPU.arm?
    url "https://github.com/dannolan/apple-ads-cli/releases/download/v0.3.0/ads_darwin_arm64.zip"
    sha256 "36f179aae1422d82174b0b6affddce06e65a5d843665961fec3161f84b29517c"
  else
    url "https://github.com/dannolan/apple-ads-cli/releases/download/v0.3.0/ads_darwin_amd64.zip"
    sha256 "2ce97079b218a089712ca9f3edb58ae1d03f854dadf8839014e14700762c0a00"
  end

  def install
    bin.install "ads"
  end

  test do
    assert_match "Apple Ads", shell_output("#{bin}/ads --help")
    assert_match version.to_s, shell_output("#{bin}/ads version --json")
  end
end
