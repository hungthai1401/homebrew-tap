class Openfortivpn < Formula
  desc "Open Fortinet client for PPP+TLS VPN tunnel services (patched fork)"
  homepage "https://github.com/adrienverge/openfortivpn"
  url "https://github.com/hungthai1401/openfortivpn/archive/refs/tags/v1.24.1-p1.tar.gz"
  version "1.24.1-p1"
  sha256 "30517ce2af3a203fbe66471dc6e8ce32e0a4eaa40a9c632a3b7943f45d7aa8d4"
  license "GPL-3.0-or-later" => { with: "cryptsetup-OpenSSL-exception" }
  head "https://github.com/hungthai1401/openfortivpn.git", branch: "fix/fortios-session-affinity"

  # Fork of openfortivpn 1.24.1 with a fallback for FortiOS 7.x gateways
  # that bind the SSL VPN web session to the TCP connection:
  # when /remote/fortisslvpn_xml fails, retry on a single connection.
  # https://github.com/hungthai1401/openfortivpn/commit/73c8667

  depends_on "autoconf" => :build
  depends_on "automake" => :build
  depends_on "pkgconf" => :build
  depends_on "openssl@4"

  def install
    system "./autogen.sh"
    system "./configure", "--disable-silent-rules",
                          "--enable-legacy-pppd", # only for pppd < 2.5.0
                          "--sysconfdir=#{etc}/openfortivpn",
                          *std_configure_args
    system "make", "install"
  end

  service do
    run [opt_bin/"openfortivpn", "-c", etc/"openfortivpn/openfortivpn/config"]
    keep_alive true
    require_root true
    log_path var/"log/openfortivpn.log"
    error_log_path var/"log/openfortivpn.log"
  end

  test do
    system bin/"openfortivpn", "--version"
  end
end
