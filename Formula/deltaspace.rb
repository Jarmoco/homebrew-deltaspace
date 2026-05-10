class Deltaspace < Formula
  desc "A lightweight filesystem diff tool"
  homepage "https://github.com/Jarmoco/DeltaSpace"
  license "MIT"

  # 1. Define URLs based on the Operating System
  if OS.mac?
    url "https://github.com/Jarmoco/DeltaSpace/releases/download/v0.1.7/deltaspace_0.1.7_macos_aarch64.tar.gz"
    sha256 "aed54321acae5730da182f0e4bf8821cf8a566e80ce459c6db5e83d7407b049b"
  elsif OS.linux?
    # Replace these with your actual Linux release URL and its SHA-256
    url "https://github.com/Jarmoco/DeltaSpace/releases/download/v0.1.7/deltaspace_0.1.7_linux_x86_64.tar.gz"
    sha256 "2a365129278eef2116399e00979ca2f39dc1df6a5b5bff801ad8b86e1331cc21"
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
