---
title: macOS (Apple)
description: 
published: true
date: 2024-01-26T09:30:55.346Z
tags: os
editor: markdown
dateCreated: 2024-01-20T20:01:50.723Z
---

# macOS (Apple)

Version Tested: Ventura (13.1)

Functionality:
* Enables CLAT automatically on IPv6-only networks if NAT64 can be detected using either pref64 or ipv6only.arpa (did not try on a DHCPv6 / Managed network)
* Advertises DHCPv4 option 108 and enables CLAT on IPv6-mostly networks (did not try on DHCPv6/Managed network)
* No issues observed when using CLAT functionality on either IPv6-only or IPV6-mostly networks, including applications ordinarily difficult for IPv6-only (Discord voice chat)