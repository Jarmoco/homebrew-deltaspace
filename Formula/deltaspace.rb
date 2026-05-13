class Deltaspace < Formula
  desc "A lightweight filesystem diff tool"
  homepage "https://github.com/Jarmoco/DeltaSpace"
  license "MIT"

  # 1. Define URLs based on the Operating System
  if OS.mac?
    url "https://github.com/Jarmoco/DeltaSpace/releases/download/v0.1.8/deltaspace_0.1.8_macos_aarch64.tar.gz"
    sha256 "d1a79433fd1a2e965ac0ba9e64f5f8163340eedb8c5e304273ff5fd3ef84b656"
  elsif OS.linux?
    url "https://github.com/Jarmoco/DeltaSpace/releases/download/v0.1.8/deltaspace_0.1.8_linux_x86_64.tar.gz"
    sha256 "f4549cddc4df181d816a9b80ffa992a53efa9fa5b46331237ee4ab6a58c67488"
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
