#!/usr/bin/env bash
declare -A domains=(
  ["git"]="github.com gitlab.com"
  ["ecommerce"]="ebay.com"
  ["social"]="twitter.com tiktok.com"
  ["payment"]="paypal.com sparkasse-aachen.de"
  ["audiostreaming"]="deezer.com tidal.com spotify.com"
  ["privacy"]="proton.me"
  ["communication"]="discord.com"
  ["education"]="duolingo.com babbel.com"
)
basepath="/mnt/cntr/unsynced/mycronpod/gosix/gosix.net/database/websites"

for key in "${!domains[@]}"; do
  mkdir -p ${basepath}/${key}
  for domain in ${domains[$key]}; do
    echo "$key: $domain"
    ./v6_test_website.sh -d $domain -f ${basepath}/${key}/${domain}.md
  done
done
