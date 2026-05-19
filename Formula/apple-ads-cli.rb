class AppleAdsCli < Formula
  desc "Agent-first CLI for Apple Ads"
  homepage "https://github.com/dannolan/apple-ads-cli"
  version "0.1.8"
  license "MIT"

  depends_on :macos

  if Hardware::CPU.arm?
    url "https://github.com/dannolan/apple-ads-cli/releases/download/v0.1.8/ads_darwin_arm64.zip"
    sha256 "b789304670fe8a06915f2499381daf82c44a98427033f47720bfd3f5b63f6098"
  else
    url "https://github.com/dannolan/apple-ads-cli/releases/download/v0.1.8/ads_darwin_amd64.zip"
    sha256 "d1cdfc8ee61fa2d010c8310996f776453f509ab8b959b9c7df28af7f01de8109"
  end

  def install
    bin.install "ads"
  end

  test do
    assert_match "Apple Ads", shell_output("#{bin}/ads --help")
    assert_match version.to_s, shell_output("#{bin}/ads version --json")
  end
end
