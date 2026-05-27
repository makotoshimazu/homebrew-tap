class GitIgnore < Formula
  desc "Append templates from github/gitignore to a local .gitignore file"
  homepage "https://github.com/makotoshimazu/git-ignore"
  version "0.1.3"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/makotoshimazu/git-ignore/releases/download/v0.1.3/git-ignore_0.1.3_darwin_arm64.tar.gz"
      sha256 "578c813c16dcab54f091e1483f4b7f4cb6e5f0480b2cb8c25335ca1089ac3ddd"
    else
      url "https://github.com/makotoshimazu/git-ignore/releases/download/v0.1.3/git-ignore_0.1.3_darwin_amd64.tar.gz"
      sha256 "6e9b30e05e223c8e7b3d1a76581ff71a14fd858b15391b9167ef6124c5ca4aa8"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/makotoshimazu/git-ignore/releases/download/v0.1.3/git-ignore_0.1.3_linux_arm64.tar.gz"
      sha256 "58e2bf3f874a42b68ce2104b0784b354aad13a4236c3b867a3e7236ad2cb5539"
    else
      url "https://github.com/makotoshimazu/git-ignore/releases/download/v0.1.3/git-ignore_0.1.3_linux_amd64.tar.gz"
      sha256 "536b4e9fe679f0fa265642191239de2fc4a610dcf89c5ffb68278ac121bde84c"
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
