#!/usr/bin/env python3
import socket
import sys

def get_ipv6_address(domain):
    try:
        ipv6_address = socket.getaddrinfo(domain, None, socket.AF_INET6)[0][4][0]
        return ipv6_address
    except (socket.gaierror, IndexError):
        sys.exit(1)

if __name__ == "__main__":
    if len(sys.argv) != 2:
        sys.exit(1)

    domain = sys.argv[1]
    ipv6_address = get_ipv6_address(domain)

    print(ipv6_address)
    sys.exit(0)
