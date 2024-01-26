---
title: Test Criteria website
description: This howto defines what tests to make for a website check
published: true
date: 2024-01-26T09:40:45.191Z
tags: website, howto, criteria
editor: markdown
dateCreated: 2024-01-20T09:53:28.658Z
---

# Test Criteria Website

> This document is unfinished. Help adding criteria
{.is-warning}

We should concentrate on sites that do NOT support IPv6 yet. Otherwise the database could get flooded with sites that are working with v6 which in turn wouldn't help very much.

| criteria | importance | description |
| - | - | - |
| AAAA record | must have | check if the domain name has an AAAA record |
| IPv6 connectivity | must have | check if a connection to the site via IPv6 is successful |
| ICMPv6 echo (ping) | nice to have | It's best practice not to filter ICMPv6 |


| Ranking | criteria |
| - | - |
| rank1 | AAAA: :radio_button: ICMPv6: :radio_button: HTTP: :radio_button: HTTPS: :radio_button: |
| rank2 | AAAA: :radio_button: ICMPv6: :radio_button: HTTP: :white_circle: HTTPS: :radio_button: |
| rank3 | AAAA: :radio_button: ICMPv6: :white_circle: HTTP or HTTPS: :radio_button: |
| rank4 | nonexistent |
| rank5 | AAAA: :radio_button: ICMPv6: :white_circle: HTTP: :white_circle: HTTPS: :white_circle: |
| rank6 | AAAA: :white_circle: ICMPv6: :white_circle: HTTP: :white_circle: HTTPS: :white_circle: |