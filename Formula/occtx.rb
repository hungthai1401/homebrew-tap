class Occtx < Formula
  desc "Fast, secure, and intuitive CLI tool for managing multiple opencode configurations"
  homepage "https://github.com/hungthai1401/occtx"
  version "0.1.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/hungthai1401/occtx/releases/download/v0.1.0/occtx-macos-aarch64"
      sha256 "b5d15f62cd9dad34bbfbdc6c661533aef7d70aae3593d25dd7622d6046792d89"
    else
      url "https://github.com/hungthai1401/occtx/releases/download/v0.1.0/occtx-macos-x86_64"
      sha256 "f4f535cd28b857a9468817120db8b9155d26c94b7a68ed068584e855834f879a"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/hungthai1401/occtx/releases/download/v0.1.0/occtx-linux-aarch64"
      sha256 "93e408f34158c00467d14c4f79191d3342741017f08dfd219f7c8cdc1e3d0a2c"
    else
      url "https://github.com/hungthai1401/occtx/releases/download/v0.1.0/occtx-linux-x86_64"
      sha256 "6737205ae68d215de458a59c1ad64c632e85355caf20755a9e36e7a89597f151"
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
