class AppleAdsCli < Formula
  desc "Agent-first CLI for Apple Ads"
  homepage "https://github.com/dannolan/apple-ads-cli"
  version "0.1.5"
  license "MIT"

  depends_on :macos

  if Hardware::CPU.arm?
    url "https://github.com/dannolan/apple-ads-cli/releases/download/v0.1.5/ads_darwin_arm64.zip"
    sha256 "be352da04d8298a6e42b429a1a94259b41544cfa55f84be19ca666e83a126c82"
  else
    url "https://github.com/dannolan/apple-ads-cli/releases/download/v0.1.5/ads_darwin_amd64.zip"
    sha256 "64eb5fbff188e8abcec55865646b756af4fa6b149a12e43e53b5c5f5e127370b"
  end

  def install
    bin.install "ads"
  end

  test do
    assert_match "Apple Ads", shell_output("#{bin}/ads --help")
    assert_match version.to_s, shell_output("#{bin}/ads version --json")
  end
end
