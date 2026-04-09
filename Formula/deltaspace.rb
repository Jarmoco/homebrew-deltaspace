class Deltaspace < Formula
  desc "A lightweight filesystem diff tool"
  homepage "https://github.com/Jarmoco/DeltaSpace"
  license "MIT"

  # 1. Define URLs based on the Operating System
  if OS.mac?
    url "https://github.com/Jarmoco/DeltaSpace/releases/download/v0.1.6/deltaspace_0.1.6_macos_aarch64.tar.gz"
    sha256 "4957f1ec9b5977959967fb985416921fb8a9f51fbcc104f25da258a219b46cc0"
  elsif OS.linux?
    # Replace these with your actual Linux release URL and its SHA-256
    url "https://github.com/Jarmoco/DeltaSpace/releases/download/v0.1.6/deltaspace_0.1.6_linux_x86_64.tar.gz"
    sha256 "fbcd52260b23a6d5b4d4e87fbec62b6901676563f8a69d9e4bdd28d9c9c7ed22"
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
