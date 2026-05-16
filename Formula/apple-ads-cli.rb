class AppleAdsCli < Formula
  desc "Agent-first Go CLI for Apple Ads"
  homepage "https://github.com/dannolan/apple-ads-cli"
  url "https://github.com/dannolan/apple-ads-cli/archive/refs/tags/v0.1.1.tar.gz"
  sha256 "b327db56ac2e9a9dd75cad06a7c3e6b6ceeb6299a9bb1fae7c7b6a5b89c2b059"
  license "MIT"

  depends_on "go" => :build

  def install
    system "go", "build", *std_go_args(output: bin/"ads"), "./cmd/ads"
  end

  test do
    assert_match "Apple Ads", shell_output("#{bin}/ads --help")
  end
end
