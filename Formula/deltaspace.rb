class Deltaspace < Formula
  desc "A lightweight filesystem diff tool"
  homepage "https://github.com/Jarmoco/DeltaSpace"
  license "MIT"

  # 1. Define URLs based on the Operating System
  if OS.mac?
    url "https://github.com/Jarmoco/DeltaSpace/releases/download/v0.1.0/deltaspace_0.1.0_macos_aarch64.tar.gz"
    sha256 "385d18da2b5a3200ff4682528843ec4383b6d515dd6830ed72981c861d7d841c"
  elsif OS.linux?
    # Replace these with your actual Linux release URL and its SHA-256
    url "https://github.com/Jarmoco/DeltaSpace/releases/download/v0.1.0/deltaspace_0.1.0_linux_x86_64.tar.gz"
    sha256 "sha256:81c32cd579e429741fab06c8a4bb9baf03715b9e681143563a4fd0d4b2f6ff60"
  end

  def install
    # Find the binary in the extracted folder
    binary_path = Dir["**/deltaspace"].first
    
    # Install it to the Homebrew bin directory
    bin.install binary_path
    
    # Ensure it's executable (critical for Linux)
    chmod 0755, bin/"deltaspace"
  end

  test do
    system "#{bin}/deltaspace", "-h"
  end
end
