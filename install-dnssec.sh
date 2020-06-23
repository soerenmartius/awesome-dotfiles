#!/usr/bin/env bash

mkdir -p /usr/local/etc

# Use dnsmasq for DNS Caching
brew install dnsmasq
sudo cp -fv .dnssec/dnsmasq.conf /usr/local/etc/dnsmasq.conf
sudo cp -fv .dnssec/homebrew.mxcl.dnsmasq.plist /Library/LaunchDaemons
sudo chown root /Library/LaunchDaemons/homebrew.mxcl.dnsmasq.plist
sudo launchctl load /Library/LaunchDaemons/homebrew.mxcl.dnsmasq.plist
sudo launchctl stop /Library/LaunchDaemons/homebrew.mxcl.dnsmasq.plist
sudo launchctl start /Library/LaunchDaemons/homebrew.mxcl.dnsmasq.plist

# Make your DNS queries safer by encrypting them with DNS-over-HTTPS and dnscrypt-proxy
brew install dnscrypt-proxy
sudo cp -fv .dnssec/dnscrypt-proxy.toml /usr/local/etc/dnscrypt-proxy.toml
sudo cp -fv .dnssec/homebrew.mxcl.dnscrypt-proxy.plist /Library/LaunchDaemons/
sudo chown root /Library/LaunchDaemons/homebrew.mxcl.dnscrypt-proxy.plist
sudo launchctl load /Library/LaunchDaemons/homebrew.mxcl.dnscrypt-proxy.plist
sudo launchctl stop /Library/LaunchDaemons/homebrew.mxcl.dnscrypt-proxy.plist
sudo launchctl start /Library/LaunchDaemons/homebrew.mxcl.dnscrypt-proxy.plist

# Set local dns resolver to dnsmasq
networksetup -setdnsservers Wi-Fi 127.0.0.1

# You might want to consider to add your lan interfaces also otherwise queries
# sent through these interfaces won't be resolved through dnscrypt-proxy
#
# For receiving a list of all hardware ports run `networksetup -listallhardwareport`
#
# networksetup -setdnsservers "USB 10/100/1000 LAN" 127.0.0.1

# Validate that installation runs
dig TXT debug.dnscrypt.info
