class AppleAdsCli < Formula
  desc "Agent-first Go CLI for Apple Ads"
  homepage "https://github.com/dannolan/apple-ads-cli"
  url "https://github.com/dannolan/apple-ads-cli/archive/refs/tags/v0.1.2.tar.gz"
  sha256 "a15ed88843b02b87c8aaf317b19e88fd3d37725f724d44851c0f2eacfdf253cc"
  license "MIT"

  depends_on "go" => :build

  def install
    ldflags = %W[
      -s -w
      -X github.com/dannolan/apple-ads-cli/internal/cli.Version=#{version}
    ]
    system "go", "build", *std_go_args(ldflags: ldflags, output: bin/"ads"), "./cmd/ads"
  end

  test do
    assert_match "Apple Ads", shell_output("#{bin}/ads --help")
    assert_match version.to_s, shell_output("#{bin}/ads version --json")
  end
end
