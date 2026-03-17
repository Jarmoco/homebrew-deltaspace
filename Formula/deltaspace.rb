class Deltaspace < Formula
  desc "A lightweight filesystem diff tool"
  homepage "https://github.com/Jarmoco/DeltaSpace"
  license "MIT"

  # 1. Define URLs based on the Operating System
  if OS.mac?
    url "https://github.com/Jarmoco/DeltaSpace/releases/download/v0.1.1/deltaspace_0.1.1_macos_aarch64.tar.gz"
    sha256 "ec248c3d8eefef37b0ed8262d215c1e06b9ed2ef03ef0d20b89ec158e9cf4725"
  elsif OS.linux?
    # Replace these with your actual Linux release URL and its SHA-256
    url "https://github.com/Jarmoco/DeltaSpace/releases/download/v0.1.1/deltaspace_0.1.1_linux_x86_64.tar.gz"
    sha256 "fca136563594e4ffe65da68c1eba340e797cb387787cc38823575ae0b31a67ba"
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
