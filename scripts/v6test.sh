#!/usr/bin/env bash
# Script to automatically test how good a website
# implements IPv6 support
# As it's generally advised to allow ICMPv6 the 
# score will also go down if ping fails

while getopts ":d:f:" opt; do
  case $opt in
    d)
      domain="$OPTARG"
      ;;
    f)
      report_file="$OPTARG"
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
  echo "Usage: $0 -d <domain> -f <report file>"
  exit 1
fi

aaaa=true
lastedit=$(date -u +"%Y-%m-%dT%H:%M:%S.%3NZ")
lasteditreadable=$(date +"%d.%m.%Y %H:%M:%S %Z")

# Check if the domain resolves to an AAAA record
ipv6_address=$(dig +short AAAA "$domain")

if [ -z "$ipv6_address" ]; then
  echo "No AAAA record found for $domain"
  aaaa=false
fi

# Further checks only when there is an IPv6 record (AAAA) in DNS
if $aaaa; then
  if ping -6 -c 1 -W 10  "$ipv6_address"; then
    ping=true
  else
    ping=false
  fi
  if curl -6 --max-time 10 --silent --head "http://$domain" | grep -q "HTTP/"; then
    http=true
  else
    http=false
  fi
  if curl -6 --max-time 10 --silent --head "https://$domain" | grep -q "HTTP/"; then
    https=true
  else
    https=false
  fi
fi

# Define rank
if [ $aaaa == "false" ]; then
  rank="rank6, totalfailure"
  symbol=":x: :wastebasket:"
  comment="The domain doesn't even have an AAAA record to begin with. The is the worst ranking a webite can get in the IPv6 database."
elif [ $ping == "false" ] && [ $http == "false" ] && [ $https == "false" ]; then
  rank="rank5"
  symbol=":arrow_double_down:"
  comment="The domain $domain has an AAAA record but does respond to neither ping/http/https"
elif [ $ping == "false" ] && ([ $http == "true" ] && [ $https == "false" ]); then
  rank="rank3"
  symbol=":3rd_place_medal:"
  comment="The domain $domain has an AAAA record, does not respond to ping and only supports either http xor https."
elif [ $ping == "false" ] && ([ $http == "false" ] && [ $https == "true" ]); then
  rank="rank3"
  symbol=":3rd_place_medal:"
  comment="The domain $domain has an AAAA record, does not respond to ping and only supports either http xor https."
elif [ $ping == "true" ] && ([ $http == "true" ] && [ $https == "false" ]); then
  rank="rank2"
  symbol=":2nd_place_medal:"
  comment="The domain $domain has an AAAA record, does respond to ping and only supports either http xor https."
elif [ $ping == "true" ] && ([ $http == "false" ] && [ $https == "true" ]); then
  rank="rank2"
  symbol=":2nd_place_medal:"
  comment="The domain $domain has an AAAA record, does respond to ping and only supports either http xor https."
elif [ $ping == "true" ] && [ $http == "true" ] && [ $https == "true" ]; then
  rank="rank1"
  symbol=":1st_place_medal:"
  comment="The domain $domain has an AAAA record, responds to ping, http and https."
fi

# Writing report file
if [ -n "$report_file" ]; then
    cat <<EOF > "$report_file"
---
title: $domain
description: Website $domain IPv6 compatibility
published: true
date: $lastedit
tags: website, $rank
editor: markdown
---

# $domain IPv6 compatibility

> The results shown here are accumulated by automation. If you think the data shown is wrong, please contact the administrators. 
{.is-info}

IPv6 ranking: $rank $symbol
Explanation: $comment
Last Update: $lasteditreadable

## The Imperative of Supporting IPv6 for Websites: Addressing Today's Challenges and Tomorrow's Needs
In the ever-evolving landscape of the internet, the adoption of Internet Protocol version 6 (IPv6) has become increasingly crucial for websites. IPv6, the next-generation internet protocol, offers numerous advantages over its predecessor, IPv4, and is essential for ensuring the continued growth, security, and accessibility of online platforms. This is particularly true when considering the challenges faced by users behind Carrier-Grade Network Address Translation (CGNAT) and the potential complications arising when clients lack IPv6 connectivity altogether.

## Global Reachability and Accessibility
IPv6 enables websites to offer global reachability by providing a vast address space, ensuring that users worldwide can access content seamlessly. In contrast, relying solely on IPv4 might lead to connectivity issues in regions where IPv4 addresses are scarce or exhausted.

## Improved Performance and Latency Reduction
IPv6 offers enhanced network performance and reduced latency, providing a more efficient communication channel between websites and users. By supporting IPv6, websites can deliver a faster and more responsive experience, contributing to increased user satisfaction.

## Future-Proofing Your Website
As the internet ecosystem continues to expand, future-proofing your website is essential. IPv6 is the standard for future internet growth, and by adopting it now, websites can avoid potential disruptions and ensure compatibility with emerging technologies and devices.

## IPv6-only Clients
Some internet service providers are deploying IPv6-only networks, and users without IPv6 support may face connectivity issues. Websites that are IPv6-ready can cater to this growing user base, ensuring inclusivity and preventing potential access problems for clients without IPv6 capabilities.

> In conclusion, the adoption of IPv6 is not just a technological necessity; it is a strategic decision to ensure the longevity, accessibility, and security of websites in a rapidly evolving digital landscape. By embracing IPv6, websites can stay ahead of the curve, offer an optimal user experience, and address the challenges faced by users behind CGNATs and those without IPv4 connectivity. It is a proactive step towards a more connected, efficient, and future-ready internet.
{.is-warning}

EOF
fi
