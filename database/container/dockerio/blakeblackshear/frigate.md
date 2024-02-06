---
title: frigate
description: blakeblackshear/frigate IPv6 compatibility
published: true
date: 2024-01-31T16:31:11.214Z
tags: container, rank6
editor: markdown
dateCreated: 2024-01-19T18:39:58.200Z
---

# blakeblackshear/frigate IPv6 compatibility

IPv6 status: :x:

[Github Project](https://github.com/blakeblackshear/frigate)
[GitHub IPv6 Issue](https://github.com/blakeblackshear/frigate/issues/5275)
[Docker Hub page](https://hub.docker.com/r/blakeblackshear/frigate)
Tag: 0.12.1

## Comments
Sadly the solution does not offer IPv6 connectivity even though it would be very easy to implement. There is an nginx embedded into the image but its configuration values let him listen on IPv4 only.