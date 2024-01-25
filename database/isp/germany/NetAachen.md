---
title: NetAachen
description: NetAachen ISP IPv6 support
published: true
date: 2024-01-20T20:53:40.874Z
tags: rank1, isp
editor: markdown
dateCreated: 2024-01-18T21:34:51.632Z
---

# NetAachen ISP IPv6 support

IPv6 status: :2nd_place_medal:

The reason for 2nd place is that NetAachen does not support DNS delegation for the statically assigned prefix, nor do they make static PTR records by request. Well actually they do, but only for the very expensive dedicated lines which I don't think is ok.
At least they offer a mail relay in case you want to run your own mailserver. The downside of this is that you cannot trace outgoing emails very good.

## private customers
NetAachen has proper support for IPv6. They provide a dynamic, routed /56 prefix by default.

## business clients
Business clients lines can get a static /48 prefix. Also private customers can get a business line and they are not much more expensive.

There are the not so very expensive business lines that are like 15 % more expensive then the private customer rates and then you get a static prefix. Then there are the really expensive lines that only companies usually can afford. For those you can get practially every option you could wish for but that's not the focus of this review.