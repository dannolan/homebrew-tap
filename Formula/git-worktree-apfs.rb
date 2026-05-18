class GitWorktreeApfs < Formula
  desc "Create Git worktrees using APFS copy-on-write cloning"
  homepage "https://github.com/dannolan/git-worktree-apfs"
  version "0.1.0"
  license "MIT"

  depends_on :macos

  if Hardware::CPU.arm?
    url "https://github.com/dannolan/git-worktree-apfs/releases/download/v0.1.0/git-worktree-apfs_Darwin_arm64.tar.gz"
    sha256 "ef704eacdac3aa0d5db655f896df878ea3c298bd6f187567519d6e698538e1af"
  else
    url "https://github.com/dannolan/git-worktree-apfs/releases/download/v0.1.0/git-worktree-apfs_Darwin_x86_64.tar.gz"
    sha256 "8452662eb808c9aeff9be9235823b546624ad63023c931984b3e701eddcd3a56"
  end

  def install
    bin.install "git-worktree-apfs"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/git-worktree-apfs version")
    assert_match "git worktree-apfs", shell_output("#{bin}/git-worktree-apfs --help")
  end
end
