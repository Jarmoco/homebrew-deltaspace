class Deltaspace < Formula
  desc "A lightweight filesystem diff tool"
  homepage "https://github.com/Jarmoco/DeltaSpace"
  license "MIT"

  # 1. Define URLs based on the Operating System
  if OS.mac?
    url "https://github.com/Jarmoco/DeltaSpace/releases/download/v0.1.5/deltaspace_0.1.5_macos_aarch64.tar.gz"
    sha256 "44fd6f5641c21a7260b84e3365099ac741fd1f882fde0f6b5a0800ef5c540dc0"
  elsif OS.linux?
    # Replace these with your actual Linux release URL and its SHA-256
    url "https://github.com/Jarmoco/DeltaSpace/releases/download/v0.1.5/deltaspace_0.1.5_linux_x86_64.tar.gz"
    sha256 "27a9562c0481ef59f059234db2fa13c6a4ceb85852df496a57a50566f85f36c1"
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
