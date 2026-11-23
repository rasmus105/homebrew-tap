# Homebrew formula template; the release workflow fills in the @...@ fields
# and pushes the result to rasmus105/homebrew-tap.
class Ptz < Formula
  desc "View documents and images in the terminal"
  homepage "https://github.com/rasmus105/ptz"
  license "AGPL-3.0-or-later"

  on_macos do
    on_arm do
      url "https://github.com/rasmus105/ptz/releases/download/v0.5.0/ptz-0.5.0-aarch64-macos.tar.gz"
      sha256 "662e55daa1b49de7b47a18187cd32876f90d420713738c2889f06c10e4391c4c"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/rasmus105/ptz/releases/download/v0.5.0/ptz-0.5.0-x86_64-linux.tar.gz"
      sha256 "de3f9045814a30e7b9b7f7113c3dada3947e223bd03e2879c4983627226903b3"
    end
  end

  def install
    bin.install "bin/ptz"
    bash_completion.install "completions/ptz.bash" => "ptz"
    zsh_completion.install "completions/_ptz"
    fish_completion.install "completions/ptz.fish"
    pkgshare.install Dir["share/ptz/*"]
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/ptz --version")
  end
end
