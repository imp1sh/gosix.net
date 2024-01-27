#!/usr/bin/env bash
declare -A domains=(
  ["ai"]="openai.com chat.openai.com"
  ["audiostreaming"]="deezer.com tidal.com spotify.com"
  ["bigtech"]="www.microsoft.com www.apple.com www.ibm.com"
  ["cars"]="bmw.de audi.de tesla.com mercedes-benz.de www.peugeot.fr renault.fr hyundai.com"
  ["communication"]="discord.com zoom.us"
  ["creativity"]="www.canva.com"
  ["ecommerce"]="www.ebay.com www.aliexpress.com"
  ["education"]="duolingo.com babbel.com www.quora.com"
  ["entertainment"]="www.imdb.com"
  ["git"]="github.com gitlab.com"
  ["insurance"]="generali.de"
  ["itservice"]="libcom.de"
  ["news"]="www.naver.com www.blogo.com edition.cnn.com www.nytimes.com www.espn.com www.marca.com www.bbc.com www.bbc.co.uk"
  ["payment"]="paypal.com sparkasse-aachen.de deutschebank.de"
  ["privacy"]="proton.me"
  ["searchengines"]="duckduckgo.com google.com"
  ["social"]="twitter.com tiktok.com www.linkedin.com onlyfans.com"
  ["software_commercial"]="www.office.com www.adobe.com"
  ["videostreaming"]="www.twitch.tv www.netflix.com"
  ["wiki"]="wiki.junicast.de"
)
basepath="/opt/gosix.net/database/websites"

cd /opt/gosix.net
git pull

cd /opt/mycronpod
for key in "${!domains[@]}"; do
  mkdir -p ${basepath}/${key}
  for domain in ${domains[$key]}; do
    echo "$key: $domain"
    ./v6_test_website.sh -d $domain -f ${basepath}/${key}/${domain}.md
  done
done

cd $basepath
git add *
git commit * -m "Updated website data" --author "Jochen Demmer <jochen@winteltosh.de>"
git push
exit 0
