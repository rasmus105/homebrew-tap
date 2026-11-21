# Homebrew formula template; the release workflow fills in the @...@ fields
# and pushes the result to rasmus105/homebrew-tap.
class Ptz < Formula
  desc "View documents and images in the terminal"
  homepage "https://github.com/rasmus105/ptz"
  license "AGPL-3.0-or-later"

  on_macos do
    on_arm do
      url "https://github.com/rasmus105/ptz/releases/download/v0.4.0/ptz-0.4.0-aarch64-macos.tar.gz"
      sha256 "42edbbd6686bedcaad55225fd296825bd3bc63a9f5b20a62744db935e416a0d9"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/rasmus105/ptz/releases/download/v0.4.0/ptz-0.4.0-x86_64-linux.tar.gz"
      sha256 "e9073d740fc2479ffd18028b8a97c08dfe0be049d7d44c3cb5ffd22976e67ca7"
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
