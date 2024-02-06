---
title: Test Criteria Datacenter
description: This howto defines what tests to make for a datacenter check
published: true
date: 2024-01-26T09:30:44.090Z
tags: datacenter, howto, criteria
editor: markdown
dateCreated: 2024-01-20T10:10:15.079Z
---

# Test Criteria Datacenter

> This document is unfinished. Help adding criteria
{.is-warning}

| criteria | importance | description |
| - | - | - |
| provides IPv6 | must have | |
| routed IPv6 | must have | some providers only offer IPv6 within the transfer net and force users to run an NDP Proxy and other nasty stuff |
| routed prefix size | must have | routed prefix size is between /56 and /48. Between /56 and /64 is too small to get the checkpoint |
| static assignment | must have | in datacenters dynamic prefixes are quite worthless, so it has to be static |