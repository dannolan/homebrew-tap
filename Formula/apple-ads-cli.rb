class AppleAdsCli < Formula
  desc "Agent-first CLI for Apple Ads"
  homepage "https://github.com/dannolan/apple-ads-cli"
  version "0.1.6"
  license "MIT"

  depends_on :macos

  if Hardware::CPU.arm?
    url "https://github.com/dannolan/apple-ads-cli/releases/download/v0.1.6/ads_darwin_arm64.zip"
    sha256 "9bcff0cdcfcd64acae1444efd8b1c6252a7d3527f2d3d88f561b2947e4436b2f"
  else
    url "https://github.com/dannolan/apple-ads-cli/releases/download/v0.1.6/ads_darwin_amd64.zip"
    sha256 "321d40bbe59203c92453cec8f8c766d421c69e52389a03826aa97b20f760109f"
  end

  def install
    bin.install "ads"
  end

  test do
    assert_match "Apple Ads", shell_output("#{bin}/ads --help")
    assert_match version.to_s, shell_output("#{bin}/ads version --json")
  end
end
