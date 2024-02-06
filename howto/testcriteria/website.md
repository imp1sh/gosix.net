---
title: Test Criteria website
description: This howto defines how to rank ipv6 website checks
published: true
date: 2024-02-02T22:51:18.794Z
tags: website, howto, criteria
editor: markdown
dateCreated: 2024-01-20T09:53:28.658Z
---

# Test Criteria Website

Website checks are done automatically. A way to add a site for contributors will be added some day. 


## Ranking criteria
| Ranking | AAAA | ICMPv6 echo request | HTTP | HTTPS |
| - | - | - | - | - |
| rank1 | :radio_button: | :radio_button: | :radio_button: | :radio_button: |
| rank2 | :radio_button: | :white_circle: | :radio_button: | :radio_button: |
| rank3 | :radio_button: | :radio_button: | support either http or https but not both | |
| rank4 | :radio_button: | :white_circle: | support either http or https but not both | |
| rank5 | :radio_button: | :radio_button: | :white_circle: | :white_circle: |
| rank5 | :radio_button: | :white_circle: | :white_circle: | :white_circle: |
| rank6 | :white_circle: | :white_circle: | :white_circle: | :white_circle: |

## AAAA verification method

## ICMPv6 verification method

## DNS query verification method