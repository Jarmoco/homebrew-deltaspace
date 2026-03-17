class Deltaspace < Formula
  desc "A lightweight filesystem diff tool"
  homepage "https://github.com/Jarmoco/DeltaSpace"
  license "MIT"

  # 1. Define URLs based on the Operating System
  if OS.mac?
    url "https://github.com/Jarmoco/DeltaSpace/releases/download/v0.1.1/deltaspace_0.1.1_macos_aarch64.tar.gz"
    sha256 "f45c0dd44d3a14ec7dcb44884c5ba6b83eab4f86175c80caade2d080eeba9451"
  elsif OS.linux?
    # Replace these with your actual Linux release URL and its SHA-256
    url "https://github.com/Jarmoco/DeltaSpace/releases/download/v0.1.1/deltaspace_0.1.1_linux_x86_64.tar.gz"
    sha256 "4980b94f338de6d25b217aa1631f5f8e3bd049db96249f5a3d0adc469c1b02a6"
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
