#!/usr/bin/env bash

while getopts ":d:" opt; do
  case $opt in
    d)
      domain="$OPTARG"
      ;;
    \?)
      echo "Invalid option: -$OPTARG" >&2
      exit 1
      ;;
    :)
      echo "Option -$OPTARG requires an argument." >&2
      exit 1
      ;;
  esac
done

if [ -z "$domain" ]; then
  echo "Usage: $0 -d <domain>"
  exit 1
fi

# Check if the domain resolves to an AAAA record
ipv6_address=$(dig +short AAAA "$domain")

if [ -z "$ipv6_address" ]; then
  echo "No AAAA record found for $domain"
  exit 1
fi

echo "IPv6 address for $domain: $ipv6_address"

# Ping the IPv6 address
#if ping -6 -W 10 "$ipv6_address" > /dev/null 2>&1; then
if ping -6 -c 1 -W 10  "$ipv6_address"; then
  echo "Ping successful"
else
  echo "Ping failed"
fi

