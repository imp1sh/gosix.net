---
title: Test Criteria website
description: This howto defines what tests to make for a website check
published: true
date: 2024-01-29T10:10:56.308Z
tags: website, howto, criteria
editor: markdown
dateCreated: 2024-01-20T09:53:28.658Z
---

# Test Criteria Website

We should concentrate on sites that do NOT support IPv6 yet. Otherwise the database could get flooded with sites that are working with v6 which in turn wouldn't help very much.

There is a [bash script](https://github.com/imp1sh/gosix.net/blob/main/scripts/v6test.sh) you can test a website according to the criteria below. It writes the report to a Markdown file. This file you can just paste or ask [Jochen Demmer](/users/JochenDemmer) to enable an automation for it. The website will then be checked in fixed intervals and the result automatically shown in the database.

## Criteria
| criteria | importance | description |
| - | - | - |
| AAAA record | must have | check if the domain name has an AAAA record |
| IPv6 connectivity | must have | check if a connection to the site via IPv6 is successful |
| ICMPv6 echo (ping) | nice to have | It's best practice not to filter ICMPv6 |

## How to rank
| Ranking | AAAA | ICMPv6 echo request | HTTP | HTTPS |
| - | - | - | - | - |
| rank1 | :radio_button: | :radio_button: | :radio_button: | :radio_button: |
| rank2 | :radio_button: | :white_circle: | :radio_button: | :radio_button: |
| rank3 | :radio_button: | :radio_button: | support either http or https but not both | |
| rank4 | :radio_button: | :white_circle: | support either http or https but not both | |
| rank5 | :radio_button: | :radio_button: | :white_circle: | :white_circle: |
| rank5 | :radio_button: | :white_circle: | :white_circle: | :white_circle: |
| rank6 | :white_circle: | :white_circle: | :white_circle: | :white_circle: |

## Methods
There are several checks made in order to verify the website's IPv6 quality:

- dns
  via python: `socket.getaddrinfo(domain, None, socket.AF_INET6)[0][4][0]`
- ping
  via bash script: `ping6 -c 1 -W 10  "$ipv6_address"`
- http
  via bash script: `curl -6 --max-time 10 --silent --head "http://$domain" | grep -q "HTTP/"`
- https
  via bash script: `curl -6 --max-time 10 --silent --head "https://$domain" | grep -q "HTTP/"`