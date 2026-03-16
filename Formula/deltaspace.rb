class Deltaspace < Formula
  desc "A lightweight filesystem diff tool"
  homepage "https://github.com/Jarmoco/DeltaSpace"
  url "https://github.com/Jarmoco/DeltaSpace/releases/download/v0.1.0/deltaspace_0.1.0_macos_aarch64.tar.gz"
  sha256 "385d18da2b5a3200ff4682528843ec4383b6d515dd6830ed72981c861d7d841c"
  license "MIT"

  def install
    # This part depends on your language. 
    # For a pre-compiled binary:
    bin.install "deltaspace"
  end

  test do
    # A simple test to verify installation
    system "#{bin}/deltaspace", "-h"
  end
end
