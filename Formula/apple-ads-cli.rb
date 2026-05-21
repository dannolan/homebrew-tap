class AppleAdsCli < Formula
  desc "Agent-first CLI for Apple Ads"
  homepage "https://github.com/dannolan/apple-ads-cli"
  version "0.1.9"
  license "MIT"

  depends_on :macos

  if Hardware::CPU.arm?
    url "https://github.com/dannolan/apple-ads-cli/releases/download/v0.1.9/ads_darwin_arm64.zip"
    sha256 "95f001511761ba065110cbf59d9e2206cbe821fdaf3888f5db7b30be55a40fdc"
  else
    url "https://github.com/dannolan/apple-ads-cli/releases/download/v0.1.9/ads_darwin_amd64.zip"
    sha256 "64ca8a59566a62ef82930963014295c654d54160419d93bc8e296d896b002f62"
  end

  def install
    bin.install "ads"
  end

  test do
    assert_match "Apple Ads", shell_output("#{bin}/ads --help")
    assert_match version.to_s, shell_output("#{bin}/ads version --json")
  end
end
