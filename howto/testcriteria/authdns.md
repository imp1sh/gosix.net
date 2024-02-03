---
title: Test Criteria authdns
description: This howto defines how authoritative Nameservers will be ranked
published: true
date: 2024-02-03T00:24:49.896Z
tags: howto, criteria, authdns
editor: markdown
dateCreated: 2024-02-02T22:45:49.016Z
---

# Test Criteria Authoritative DNS Server

Authdns checks are done automatically. A way to add a server for contributors will be added some day. 


## Ranking criteria
At first we check if a nameserver has an IPv6 address (AAAA). Further tests are only made if that's the case. Further tests are ICMPv6 echo requests and DNS queries sent via IPv6 to the server. Some nameservers resolve to multiple IPv6 addresses.

| Ranking | AAAA | ICMPv6 echo request | DNS Query answered | 
| - | - | - | - | 
| rank1 | :radio_button:| 50-100% | 80-100% | 
| rank2 | :radio_button: | 0-50% | 80-100% |
| rank3 | :radio_button: | 40-80% | 40-80% |
| rank4 | :radio_button: | 0-50% |  40-80% |
| rank5 | :radio_button: |  0-100% |  0-40% | 
| rank6 | :white_circle: | :white_circle: | :white_circle: |