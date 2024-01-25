---
title: Test Criteria ISP
description: This howto defines what tests to make for an ISP check
published: true
date: 2024-01-25T21:32:17.249Z
tags: isp, howto, criteria
editor: markdown
dateCreated: 2024-01-20T09:49:28.639Z
---

# Test Criteria ISP

> This document is unfinished. Help adding criteria
{.is-warning}

| criteria | importance | description |
| - | - | - |
| routed IPv6 | must have | some providers only offer IPv6 within the transfer net and force users to run an NDP Proxy and other nasty stuff |
| routed prefix size | must have | routed prefix size is between /58 and /48. Between /58 and /64 is too small to get the checkpoint. If the provider assigns via IPv6 Prefix Delegation he might hand out single /64 networks. This is also acceptable as long as you can get multiple of those /64 networks. Currently we consider this requirement as fulfilled when the amount of /64 networks is not below 256.
| static prefix | nice to have | A static prefix as a (paid) option should be there but it's no must.

## Resources
[Ripe best practices](https://www.ripe.net/publications/docs/ripe-690/)
[Arin adressing plan for service providers](https://www.arin.net/vault/blog/2018/07/05/ipv6-addressing-plan-design-for-service-providers/)