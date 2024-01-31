---
title: Page container howto
description: Description on how to write a review for a container
published: true
date: 2024-01-31T16:30:29.260Z
tags: container, howto
editor: markdown
dateCreated: 2024-01-19T18:57:37.486Z
---

# Page Container hotwo

You should include

- [x] IPv6 Status
- [x] Github Repo URL
- [x] Container Registry URL
- [x] The tag of the container the tests ran on
- [x] If possible discussions or issues that refer to IPv6 support
- [x] A short description of your experience. This text shall help people with less experience about the container and IPv6 to get an idea about the implementation status
{.grid-list}

You can also add a short description what the container is for.

Below the database/container folder the structure shall be as follows:

- registry id (docker.io / ghcr.io)
  - maintainer_name (some images don't have this. In this case skip this step and contine with:)
    - image name
  
Example:
database/containers/docker.io/blakeblackshear/frigate for this [image](https://hub.docker.com/r/blakeblackshear/frigate)

