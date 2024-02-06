---
title: Test Criteria OS
description: This howto defines what tests to make for an OS check
published: true
date: 2024-01-26T09:30:50.396Z
tags: howto, criteria, os
editor: markdown
dateCreated: 2024-01-20T09:45:25.657Z
---

# Test Criteria OS

> This document is unfinished. Help adding criteria
{.is-warning}

Most OSes have integrated software for those matters like iOS, Windows and macOS. On Linux and FreeBSD though it's configurable wether to use e.g. NetworkManager, systemd-networkd, netplan, dhcpcd or some other software. In this cases no evaluation of the OS will be made but there will be links to available software solutions with a hint, what the default network manager for the OS actually is.


| criteria | importance | description |
| - | - | - |
| DHCPv6 client support | must have | |
| static IPv6 configuration | must have | |
| IPv6 only | nice to have | IPv6 only networks are quite rare nowadays. As they get more popular the need for this rises |
| DUID findable | must have | Commonly the DUID for the DHCPv6 client is automatically created. It needs to be clear how to find it out |
| DUID configurable | must have | Configure the DUID for DHCPv6 client needs to be possible |

Todo: check RFC 4191, 4291, 4443, 4861, 4862, 5095, 6980, 7217, 8106, 8200, 8201