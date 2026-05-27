class Ocvm < Formula
  desc "OpenCode Version Manager - Manage multiple versions of custom OpenCode"
  homepage "https://github.com/hungthai1401/opencode"
  url "https://raw.githubusercontent.com/hungthai1401/opencode/dev/ocvm"
  version "1.0.0"
  sha256 "e0453dba0c65acb7424cae8609ad2858471499060e9fed9cba5fccd4973935af"

  def install
    bin.install "ocvm"
  end

  def caveats
    <<~EOS
      To use ocvm, add the following to your shell profile (~/.bashrc or ~/.zshrc):
        export PATH="$HOME/.oc/current:$PATH"

      Then restart your shell or run:
        source ~/.bashrc  # or ~/.zshrc

      Usage:
        ocvm install 1.15.11-custom    # Install a version
        ocvm use 1.15.11-custom        # Switch to a version
        ocvm list                      # List installed versions
        ocvm current                   # Show current version
        ocvm uninstall 1.15.11-custom  # Remove a version
    EOS
  end

  test do
    system "#{bin}/ocvm", "help"
  end
end
