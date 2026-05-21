class Ga4Cli < Formula
  desc "Tiny, shippable Google Analytics 4 CLI"
  homepage "https://github.com/dannolan/ga4-cli"
  version "0.1.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/dannolan/ga4-cli/releases/download/v0.1.0/ga4_darwin_arm64.zip"
      sha256 "b5a9a4efee1f1dc67a48e471791358f701f91fb75c0cb4ebffdf3335debce74c"
    else
      url "https://github.com/dannolan/ga4-cli/releases/download/v0.1.0/ga4_darwin_amd64.zip"
      sha256 "c6474c9bb12d878ef6f2bc2c620cdff613356a5bb1e28fe1816f1692cb5bd476"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/dannolan/ga4-cli/releases/download/v0.1.0/ga4_linux_arm64.zip"
      sha256 "3651f9fb575a2657d991cea65314184c1105fd4e5c2eb18fabab4ddca51e0960"
    else
      url "https://github.com/dannolan/ga4-cli/releases/download/v0.1.0/ga4_linux_amd64.zip"
      sha256 "34be2bca256ab491f34810fbb8bb251c6b7a302ce0905bcdf06f2a4a4637331c"
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
