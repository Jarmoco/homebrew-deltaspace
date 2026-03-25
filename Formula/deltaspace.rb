class Deltaspace < Formula
  desc "A lightweight filesystem diff tool"
  homepage "https://github.com/Jarmoco/DeltaSpace"
  license "MIT"

  # 1. Define URLs based on the Operating System
  if OS.mac?
    url "https://github.com/Jarmoco/DeltaSpace/releases/download/v0.1.3/deltaspace_0.1.3_macos_aarch64.tar.gz"
    sha256 "ea106fb2b8e70694f55c2db787f1014960f0874ad2cbdb88142f4fec909ec0e6"
  elsif OS.linux?
    # Replace these with your actual Linux release URL and its SHA-256
    url "https://github.com/Jarmoco/DeltaSpace/releases/download/v0.1.3/deltaspace_0.1.3_linux_x86_64.tar.gz"
    sha256 "b516656d66d48c00c2f52edd81a2e43e629b5cf60fa6039aa1b8d73eced68e15"
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
