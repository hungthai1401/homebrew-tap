class Occtx < Formula
  desc "Fast, secure, and intuitive CLI tool for managing multiple opencode configurations"
  homepage "https://github.com/hungthai1401/occtx"
  version "0.1.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/hungthai1401/occtx/releases/download/v0.1.0/occtx-macos-aarch64"
      sha256 "9335f18c50bc2dd7ee9984183476a04e001fd71b22f222b0c618470ba6d6898b"
    else
      url "https://github.com/hungthai1401/occtx/releases/download/v0.1.0/occtx-macos-x86_64"
      sha256 "0dd8ff2966a0d4ac1a4cea6186e7f91fb02f9c5969529666394e6522be3e2791"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/hungthai1401/occtx/releases/download/v0.1.0/occtx-linux-aarch64"
      sha256 "0a0d1d16690147f95739478f9e28fcf2811984c485ca73e99eb642528106f2be"
    else
      url "https://github.com/hungthai1401/occtx/releases/download/v0.1.0/occtx-linux-x86_64"
      sha256 "1cbffe3ba351ead306c5afebffc62348c45a1a3eb5e76d74e30cfb79c4e81eb0"
    end
  end

  def install
    bin.install "occtx"
  end

  test do
    system "#{bin}/occtx", "--version"
  end
end
