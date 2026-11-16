# Homebrew formula template; the release workflow fills in the @...@ fields
# and pushes the result to rasmus105/homebrew-tap.
class Ptz < Formula
  desc "View documents and images in the terminal"
  homepage "https://github.com/rasmus105/ptz"
  license "AGPL-3.0-or-later"

  on_macos do
    on_arm do
      url "https://github.com/rasmus105/ptz/releases/download/v0.3.0/ptz-0.3.0-aarch64-macos.tar.gz"
      sha256 "b3f9c92a438fab810d35e40479014e594cb39e8d5f50a54be6b768cace48cf69"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/rasmus105/ptz/releases/download/v0.3.0/ptz-0.3.0-x86_64-linux.tar.gz"
      sha256 "c5cebbfb456232af90dafb20bb450142f8ebcf8c7f1eb80613e690406764a99a"
    end
  end

  def install
    bin.install "bin/ptz"
    pkgshare.install Dir["share/ptz/*"]
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/ptz --version")
  end
end
