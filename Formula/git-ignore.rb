class GitIgnore < Formula
  desc "Append templates from github/gitignore to a local .gitignore file"
  homepage "https://github.com/makotoshimazu/git-ignore"
  version "0.1.1"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/makotoshimazu/git-ignore/releases/download/v0.1.1/git-ignore_0.1.1_darwin_arm64.tar.gz"
      sha256 "4a0513be6eb11172e95a565573bc3d320e197475f3daba8264161495596b8f7d"
    else
      url "https://github.com/makotoshimazu/git-ignore/releases/download/v0.1.1/git-ignore_0.1.1_darwin_amd64.tar.gz"
      sha256 "ff944ace833dceba837ea2d6b54e0b437dc47ed9d29ae170ca42cc23a6d680ec"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/makotoshimazu/git-ignore/releases/download/v0.1.1/git-ignore_0.1.1_linux_arm64.tar.gz"
      sha256 "8170513a75779ba508c02b61d5c0fa5ebc54f73f17b9100c1e314af9beefcf18"
    else
      url "https://github.com/makotoshimazu/git-ignore/releases/download/v0.1.1/git-ignore_0.1.1_linux_amd64.tar.gz"
      sha256 "03ae9964294f04f0a2f17259cc1ff748062713edfb04c2b96c54f16fe1d84c07"
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
