# homebrew-tap

Personal Homebrew tap.

## Install

```sh
brew tap hungthai1401/tap
brew install <formula>
```

The short form also works and taps automatically:

```sh
brew install hungthai1401/tap/<formula>
```

## Formulae

| Formula | Description | Source |
| ------- | ----------- | ------ |
| `oc` | Custom OpenCode (oc), an AI coding agent with a `display_response` tool | [hungthai1401/opencode](https://github.com/hungthai1401/opencode) |
| `occtx` | CLI for managing multiple OpenCode configurations | [hungthai1401/occtx](https://github.com/hungthai1401/occtx) |
| `ocvm` | OpenCode version manager | [hungthai1401/opencode](https://github.com/hungthai1401/opencode) |
| `openfortivpn` | Fortinet SSL VPN client, patched fork of v1.24.1 | [hungthai1401/openfortivpn](https://github.com/hungthai1401/openfortivpn) |

## openfortivpn

Fork of [adrienverge/openfortivpn](https://github.com/adrienverge/openfortivpn) 1.24.1 with one extra behavior, in the branch [`fix/fortios-session-affinity`](https://github.com/hungthai1401/openfortivpn/tree/fix/fortios-session-affinity).

Some FortiOS 7.x gateways bind the SSL VPN web session to the TCP connection that authenticated. With the stock client, `GET /remote/index` then answers 403 and terminates the session, and `/remote/fortisslvpn_xml` from a fresh connection is intermittently answered with a 302 redirect to `/remote/login`. The client reports:

```
INFO:   Remote gateway has allocated a VPN.
ERROR:  Could not get VPN configuration (HTTP status code).
```

The patched client keeps the stock flow and only retries when that request fails: it re-authenticates and fetches `/remote/fortisslvpn_xml` on a single connection, without reconnecting in between. On a gateway of this type the retry succeeded in every test run; on other gateways nothing changes.

### Requirements

The formula builds from source, so Homebrew needs current Command Line Tools. If install fails with "Your Command Line Tools are too outdated":

```sh
softwareupdate --list
sudo softwareupdate -i "Command Line Tools for Xcode <version>"
```

### Configuration

The config lives in `~/.config/openfortivpn/<profile>`. Gateways that push non-FortiClient sessions into a host check also need a FortiClient `user-agent`, otherwise login succeeds but the session dies before the tunnel is configured:

```ini
host = <gateway-host>
port = 10443
username = <user>
password = <password>
user-agent = FortiSSLVPN (Windows NT; SV1 [SV{v=02.01; f=07;}])
user-cert = /absolute/path/to/cert.pem
user-key = /absolute/path/to/key.pem
trusted-cert = <sha256 of the gateway certificate>
set-dns = 0
pppd-use-peerdns = 1
```

Paths to the certificate and key must be absolute; the client resolves them against the working directory it was started from, not against the config file.

### Run

```sh
sudo openfortivpn -c ~/.config/openfortivpn/<profile>
```

If `sudo` cannot find the binary, use the full path: `sudo /opt/homebrew/bin/openfortivpn ...`
