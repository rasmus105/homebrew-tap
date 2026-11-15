# Homebrew formula template; the release workflow fills in the @...@ fields
# and pushes the result to rasmus105/homebrew-tap.
class Ptz < Formula
  desc "Render PDFs in the terminal"
  homepage "https://github.com/rasmus105/ptz"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/rasmus105/ptz/releases/download/v0.2.0/ptz-0.2.0-aarch64-macos.tar.gz"
      sha256 "8d26a135facc046b79eacb9875f96223886c506dbe06726e8d1f3456adc9e7b8"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/rasmus105/ptz/releases/download/v0.2.0/ptz-0.2.0-x86_64-linux.tar.gz"
      sha256 "bdf5c05f4b93891666e80e204952039cfbc3fad51d575a6042a765642fcadbb8"
    end
  end

  def install
    # ptz finds PDFium in ../lib relative to itself; libexec keeps PDFium out
    # of the shared Homebrew lib/ directory.
    libexec.install "bin", "lib"
    bin.install_symlink libexec/"bin/ptz"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/ptz --version")
  end
end
