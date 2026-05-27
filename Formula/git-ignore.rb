class GitIgnore < Formula
  desc "Append templates from github/gitignore to a local .gitignore file"
  homepage "https://github.com/makotoshimazu/git-ignore"
  version "0.1.2"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/makotoshimazu/git-ignore/releases/download/v0.1.2/git-ignore_0.1.2_darwin_arm64.tar.gz"
      sha256 "00efba5c75118147b54f2bee4a0c8048815c8e0b8c09a6f6087be150c785bca5"
    else
      url "https://github.com/makotoshimazu/git-ignore/releases/download/v0.1.2/git-ignore_0.1.2_darwin_amd64.tar.gz"
      sha256 "3554e60f0c35f3404b7feccd408b0aec8db732ee40e1f7f6930d8f7d7d7e126f"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/makotoshimazu/git-ignore/releases/download/v0.1.2/git-ignore_0.1.2_linux_arm64.tar.gz"
      sha256 "c431baf5f0336cdea34ef0f946dd0c50a96e99647c556e2dd7871d5bd40c79d5"
    else
      url "https://github.com/makotoshimazu/git-ignore/releases/download/v0.1.2/git-ignore_0.1.2_linux_amd64.tar.gz"
      sha256 "386207893b90fe86c0c9135739714a860e7d7b4f19be483d3179980dc3641d71"
    end
  end

  def install
    bin.install "git-ignore"
    generate_completions_from_executable(bin/"git-ignore", "completion", shells: [:zsh])
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/git-ignore --version")
  end
end
