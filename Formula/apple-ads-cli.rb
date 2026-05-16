class AppleAdsCli < Formula
  desc "Agent-first Go CLI for Apple Ads"
  homepage "https://github.com/dannolan/apple-ads-cli"
  url "https://github.com/dannolan/apple-ads-cli/archive/refs/tags/v0.1.0.tar.gz"
  sha256 "5a39b73cd53c579bf059dae3695dc98cc988e234f90310c3167d0ac1e2f5a79b"
  license "MIT"

  depends_on "go" => :build

  def install
    system "go", "build", *std_go_args(output: bin/"ads"), "./cmd/ads"
  end

  test do
    assert_match "Apple Ads", shell_output("#{bin}/ads --help")
  end
end
