class Deltaspace < Formula
  desc "A lightweight filesystem diff tool"
  homepage "https://github.com/Jarmoco/DeltaSpace"
  license "MIT"

  # 1. Define URLs based on the Operating System
  if OS.mac?
    url "https://github.com/Jarmoco/DeltaSpace/releases/download/v0.1.4/deltaspace_0.1.4_macos_aarch64.tar.gz"
    sha256 "1633f202d01ec70e23189bfa9fceeb280e20444b141c917458165fee510a565e"
  elsif OS.linux?
    # Replace these with your actual Linux release URL and its SHA-256
    url "https://github.com/Jarmoco/DeltaSpace/releases/download/v0.1.4/deltaspace_0.1.4_linux_x86_64.tar.gz"
    sha256 "69fb9285fe5fe3651bdcc3eda3a5c44a81cd74ef519957bdf91455bcb2abd657"
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
