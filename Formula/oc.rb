class Oc < Formula
  desc "Custom OpenCode (oc) - AI coding agent with display_response tool"
  homepage "https://github.com/hungthai1401/opencode"
  version "1.15.11-custom"

  depends_on "ripgrep"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/hungthai1401/opencode/releases/download/v1.15.11-custom/oc-darwin-arm64.zip"
      sha256 "4866bb77d907bc1b4b942c020a6912829c346b507e32bada1fc393e13259a2a4"
    else
      url "https://github.com/hungthai1401/opencode/releases/download/v1.15.11-custom/oc-darwin-x64.zip"
      sha256 "90dda71d7d8134fcd38dbb9b9e88fc6c4c13768ef0bed572beaf1c1af6b57b03"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/hungthai1401/opencode/releases/download/v1.15.11-custom/oc-linux-arm64.tar.gz"
      sha256 "10046121c2d60528ce39fa95d7ea64ad5da9844e4449629a33d7005d22a033b6"
    else
      url "https://github.com/hungthai1401/opencode/releases/download/v1.15.11-custom/oc-linux-x64.tar.gz"
      sha256 "8171908f14124643f6a25e716ebdfaae1be460f5e1ea5c56977f9a7905febb71"
    end
  end

  def install
    # Homebrew strips the single top-level directory from the archive,
    # so the staging root contains bin/opencode directly.
    bin.install "bin/opencode" => "oc"
  end

  test do
    system "#{bin}/oc", "--version"
  end
end
