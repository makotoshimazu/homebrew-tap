class GitIgnore < Formula
  desc "Append templates from github/gitignore to a local .gitignore file"
  homepage "https://github.com/makotoshimazu/git-ignore"
  version "0.1.0"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/makotoshimazu/git-ignore/releases/download/v0.1.0/git-ignore_0.1.0_darwin_arm64.tar.gz"
      sha256 "d4f265e3e15f37383412ee4b40d80057833726baa03f6128a69c1646dd3d65a3"
    else
      url "https://github.com/makotoshimazu/git-ignore/releases/download/v0.1.0/git-ignore_0.1.0_darwin_amd64.tar.gz"
      sha256 "a5f9ba2afad00b5aacea4b8c808a627d1f5dfd596433212a1f4d86aa0a6972d3"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/makotoshimazu/git-ignore/releases/download/v0.1.0/git-ignore_0.1.0_linux_arm64.tar.gz"
      sha256 "e39c54be2c7dab22c3e030d051b21ccaf29d1b95b4fa064ec9af3310ba06005e"
    else
      url "https://github.com/makotoshimazu/git-ignore/releases/download/v0.1.0/git-ignore_0.1.0_linux_amd64.tar.gz"
      sha256 "2f8c0d8693885705b82870397811eb3df6863ac3b3e6263ce168cc1cdeccc216"
    end
  end

  def install
    bin.install "git-ignore"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/git-ignore --version")
  end
end
