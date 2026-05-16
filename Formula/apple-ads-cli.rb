class AppleAdsCli < Formula
  desc "Agent-first CLI for Apple Ads"
  homepage "https://github.com/dannolan/apple-ads-cli"
  version "0.1.7"
  license "MIT"

  depends_on :macos

  if Hardware::CPU.arm?
    url "https://github.com/dannolan/apple-ads-cli/releases/download/v0.1.7/ads_darwin_arm64.zip"
    sha256 "c250dec5be62e9e304567ed9b57a70a550f6282e6e211c7ab2bdee1b325bd346"
  else
    url "https://github.com/dannolan/apple-ads-cli/releases/download/v0.1.7/ads_darwin_amd64.zip"
    sha256 "bed8f58964b0605955905cf4674ee091aa6c941c10bb559e389a79a4f901b838"
  end

  def install
    bin.install "ads"
  end

  test do
    assert_match "Apple Ads", shell_output("#{bin}/ads --help")
    assert_match version.to_s, shell_output("#{bin}/ads version --json")
  end
end
