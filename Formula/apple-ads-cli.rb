class AppleAdsCli < Formula
  desc "Agent-first CLI for Apple Ads"
  homepage "https://github.com/dannolan/apple-ads-cli"
  version "0.2.0"
  license "MIT"

  depends_on :macos

  if Hardware::CPU.arm?
    url "https://github.com/dannolan/apple-ads-cli/releases/download/v0.2.0/ads_darwin_arm64.zip"
    sha256 "1b06f0ee932ac4d220a1496f1b29435c16beb89928c42c1cc59ca8272a36e813"
  else
    url "https://github.com/dannolan/apple-ads-cli/releases/download/v0.2.0/ads_darwin_amd64.zip"
    sha256 "86e32e6339ae45fd2484e7a2ba176813edeec1797b05b75e0554c2f7b9d4fa68"
  end

  def install
    bin.install "ads"
  end

  test do
    assert_match "Apple Ads", shell_output("#{bin}/ads --help")
    assert_match version.to_s, shell_output("#{bin}/ads version --json")
  end
end
