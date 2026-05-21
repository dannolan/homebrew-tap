class Ga4Cli < Formula
  desc "Tiny, shippable Google Analytics 4 CLI"
  homepage "https://github.com/dannolan/ga4-cli"
  version "0.1.2"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/dannolan/ga4-cli/releases/download/v0.1.2/ga4_darwin_arm64.zip"
      sha256 "19dd517c69b138607a704c2b6837ea7edbef350677491eec879c1a59398f6502"
    else
      url "https://github.com/dannolan/ga4-cli/releases/download/v0.1.2/ga4_darwin_amd64.zip"
      sha256 "0e87706117c297da20ca87081eee688f7b491a2f0f18ebb7f7f46f154224272b"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/dannolan/ga4-cli/releases/download/v0.1.2/ga4_linux_arm64.zip"
      sha256 "dc2244df2b8d024ee9bcb38d65b4f803a825ecd5d0b106d95f40a7955740c8a7"
    else
      url "https://github.com/dannolan/ga4-cli/releases/download/v0.1.2/ga4_linux_amd64.zip"
      sha256 "1be156bc63f547c0a6ed2c45414293c713c016a47ae0d139bc8f0adabac4ab1d"
    end
  end

  def install
    bin.install "ga4"
  end

  test do
    assert_match "Google Analytics 4", shell_output("#{bin}/ga4 --help")
    assert_match version.to_s, shell_output("#{bin}/ga4 version --json")
    assert_match "ga4-cli", shell_output("#{bin}/ga4 manifest --json")
  end
end
