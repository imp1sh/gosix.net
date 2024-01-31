---
title: Test Criteria website
description: This howto defines what tests to make for a website check
published: true
date: 2024-01-31T21:36:03.953Z
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

## DNS verification method
```python
addr_info = socket.getaddrinfo(domain, None, socket.AF_INET6)
ipv6_addresses = [info[4][0] for info in addr_info if info[1] == socket.SOCK_STREAM and info[0] == socket.AF_INET6]
```
## ICMPv6 verification method
```bash
ping6 -c 1 -W 10  "$ipv6_address"
```
## HTTP verification method
```python
conn = http.client.HTTPConnection(ip, port, timeout=timeout)
conn.request("HEAD", "/")
response = conn.getresponse()
```

## HTTPS verification method
```python
ipv6_socket = socket.socket(socket.AF_INET6, socket.SOCK_STREAM)
ipv6_socket.settimeout(timeout)
ipv6_socket.connect((ipv6_address, port))
context = ssl.create_default_context()
ssl_socket_ipv6 = context.wrap_socket(ipv6_socket, server_hostname=domain_name)
ssl_socket_ipv6.sendall(b"GET / HTTP/1.1\r\nHost: " + domain_name.encode() + b"\r\n\r\n")
response_ipv6 = ssl_socket_ipv6.recv(1024)
```