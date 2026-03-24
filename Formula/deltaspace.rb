class Deltaspace < Formula
  desc "A lightweight filesystem diff tool"
  homepage "https://github.com/Jarmoco/DeltaSpace"
  license "MIT"

  # 1. Define URLs based on the Operating System
  if OS.mac?
    url "https://github.com/Jarmoco/DeltaSpace/releases/download/v0.1.2/deltaspace_0.1.2_macos_aarch64.tar.gz"
    sha256 "62790950ca14aad20174d05d4b576d81378dfff69f464c97f0ad7ee0a04da3af"
  elsif OS.linux?
    # Replace these with your actual Linux release URL and its SHA-256
    url "https://github.com/Jarmoco/DeltaSpace/releases/download/v0.1.2/deltaspace_0.1.2_linux_x86_64.tar.gz"
    sha256 "702a322376339c824d0e7aad2badd6ff7fbbe1b4a26c1cffae2e8f64f1cd1189"
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
