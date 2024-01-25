---
title: Test Criteria Container
description: This howto defines what tests to make for a container image check
published: true
date: 2024-01-20T10:08:16.654Z
tags: container, howto, criteria
editor: markdown
dateCreated: 2024-01-20T10:08:15.400Z
---

# Test Criteria Container

> This document is unfinished. Help adding criteria
{.is-warning}

| criteria | importance | description |
| - | - | - |
| works via IPv6 per default | must have | some image's default config does not work with IPv6 |
| bind configuration | must have | the image needs to be able to have configurable bind options so you can decide for yourself what IPs to bind to if you wish IPv4 only, IPv6 only or dual stack mode |
| IPv6 only | nice to have | IPv6 only networks are quite rare nowadays. As they get more popular the need for this rises |