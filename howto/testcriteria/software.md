---
title: Test Criteria Software
description: This howto defines what tests to make for a software check
published: true
date: 2024-01-26T09:30:51.655Z
tags: software, howto, criteria
editor: markdown
dateCreated: 2024-01-20T10:03:15.950Z
---

# Test Criteria Software

> This document is unfinished. Help adding criteria
{.is-warning}

When it comes to software we split into two sections:
- client software
- server software
The criteria depend on if it is a client or a server software.

## Server Software

| criteria | importance | description |
| - | - | - |
| IP binding configuration | must have | The binding configuration need to support to bind to IPv6, dual stack and or other modes like [::] |
| outbound connections | must have | Sometimes even server software initiates communication. Some of those software do not respect the IPv6 before IPv4 rule when a DNS record both resolves A and AAAA |

Todo: check RFC 4191, 4291, 4443, 4861, 4862, 5095, 6980, 7217, 8106, 8200, 8201

## Client Software

| criteria | importance | description |
| - | - | - |
| outbound connections | must have | Client software sometimes does not respect the IPv6 before IPv4 rule when a DNS record both resolves A and AAAA |
