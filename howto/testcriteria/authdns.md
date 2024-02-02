---
title: Test Criteria authdns
description: This howto defines how authoritative Nameservers will be ranked
published: true
date: 2024-02-02T23:06:50.554Z
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
| rank1 | :radio_button:| :radio_button: 100% | :radio_button: 100%  | 
| rank2 | :radio_button: | :radio_button: 50%+ | :radio_button: 100% |
| rank3 | :radio_button: | :radio_button: 33-50% | :radio_button: 75%+ |
| rank4 | :radio_button: | :white_circle: | :radio_button: 50-75% |
| rank5 | :radio_button: | :white_circle: | :radio_button: 33-50% | 
| rank6 | :white_circle: | :white_circle: | :white_circle: |