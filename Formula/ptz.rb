# Homebrew formula template; the release workflow fills in the @...@ fields
# and pushes the result to rasmus105/homebrew-tap.
class Ptz < Formula
  desc "Render PDFs in the terminal"
  homepage "https://github.com/rasmus105/ptz"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/rasmus105/ptz/releases/download/v0.1.0/ptz-0.1.0-aarch64-macos.tar.gz"
      sha256 "40d3cf765635f77ef8786dac4e79b7879f84a2049d32814ee7f530833d20f6d4"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/rasmus105/ptz/releases/download/v0.1.0/ptz-0.1.0-x86_64-linux.tar.gz"
      sha256 "e08f3bb31549fb10c4c7c47e17138669a390cb7d78231fc53106bfd7a1c50827"
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
