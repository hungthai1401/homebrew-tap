class Occtx < Formula
  desc "Fast, secure, and intuitive CLI tool for managing multiple opencode configurations"
  homepage "https://github.com/hungthai1401/occtx"
  version "0.1.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/hungthai1401/occtx/releases/download/v0.1.0/occtx-macos-aarch64"
      sha256 "f491195cc7574887d25bbd4c4380863f8b27a33f4113c1228800404d4f776479"
    else
      url "https://github.com/hungthai1401/occtx/releases/download/v0.1.0/occtx-macos-x86_64"
      sha256 "4f1fa1ae522b1be32445a7f2abd295915d155e2d451ce81138e6be24d8ee63d8"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/hungthai1401/occtx/releases/download/v0.1.0/occtx-linux-aarch64"
      sha256 "5e9eb0caebc501af79e1f6e0b481a16f453ae01176f8dd3bcbf9ade441b8601f"
    else
      url "https://github.com/hungthai1401/occtx/releases/download/v0.1.0/occtx-linux-x86_64"
      sha256 "43039d436b8dce3adc80747293f14e15e0bd7d83811eb1f7268d675929f54e8b"
    end
  end

  def install
    # Simply install and rename the downloaded binary to 'occtx'
    if OS.mac?
      bin.install (Hardware::CPU.arm? ? "occtx-macos-aarch64" : "occtx-macos-x86_64") => "occtx"
    else
      bin.install (Hardware::CPU.arm? ? "occtx-linux-aarch64" : "occtx-linux-x86_64") => "occtx"
    end
  end

  test do
    system "#{bin}/occtx", "--version"
  end
end
