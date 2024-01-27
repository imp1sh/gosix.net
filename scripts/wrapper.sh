#!/usr/bin/env bash
declare -A domains=(
  ["ai"]="openai.com chat.openai.com"
  ["audiostreaming"]="deezer.com tidal.com spotify.com"
  ["bigtech"]="www.microsoft.com www.apple.com www.ibm.com"
  ["cars"]="bmw.de audi.de tesla.com mercedes-benz.de www.peugeot.fr renault.fr hyundai.com"
  ["communication"]="discord.com zoom.us"
  ["creativity"]="www.canva.com"
  ["datacenter"]="www.hetzner.com www.relaix.net www.netcup.de www.noris.de"
  ["ecommerce"]="www.ebay.com www.aliexpress.com www.bol.de"
  ["education"]="duolingo.com babbel.com www.quora.com www.berlitz.com www.inlingua-aachen.de"
  ["entertainment"]="www.imdb.com"
  ["git"]="github.com gitlab.com"
  ["insurance"]="generali.de www.allianz.de www.munichre.com www.talanx.com www.hannover-rueck.de www.ergo.de www.ruv.de www.debeka.de www.axa.de www.vkb.de www.huk.de www.signal-iduna.de www.zurich.de www.provinzial.de"
  ["isp"]="www.netaachen.de www.telekom.de www.relaix.net www.1und1.de www.vodafone.de www.o2online.de www.pyur.com www.m-net.de www.freenet.de www.deutsche-glasfaser.de www.netcologne.de"
  ["itservice"]="libcom.de"
  ["news"]="www.naver.com www.blogo.com edition.cnn.com www.nytimes.com www.espn.com www.marca.com www.bbc.com www.bbc.co.uk"
  ["payment"]="paypal.com sparkasse-aachen.de deutschebank.de groupebpce.com www.societegenerale.com www.deutsche-bank.de www.td.com www.goldmansachs.com www.cmbchina.com www.rbc.com www.cib.com.cn www.citicbank.com www.spdb.com.cn www.creditmutuel.fr www.intesasanpaolo.com www.lloydsbankinggroup.com www.morganstanley.com www.ubs.com www.cmbc.com.cn www.ing.com www.natwestgroup.com www.unicreditgroup.eu www.scotiabank.com www.cebbank.com www.nochubank.or.jp www.bmo.com www.labanquepostale.com www.commbank.com.au www.credit-suisse.com www.sc.com www.sc.com www.bbva.com bank.pingan.com www.caixabank.com www.rabobank.com www.dzbank.de www.santander.com www.bankcomm.com home.barclays www.wellsfargo.com www.mizuho-fg.co.jp www.psbc.com www.jp-bank.japanpost.jp www.smfg.co.jp www.citigroup.com www.credit-agricole.fr group.bnpparibas www.hsbc.com www.bankofamerica.com www.mufg.jp www.jpmorganchase.com www.boc.cn www.abchina.com www.ccb.com www.icbc-ltd.com"
  ["privacy"]="proton.me"
  ["searchengines"]="duckduckgo.com google.com"
  ["social"]="twitter.com tiktok.com www.linkedin.com onlyfans.com imgur.com noc.social"
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
git config --global user.email "jochen@winteltosh.de"
git config --global user.name "Jochen Demmer"
git add *
git commit * -m "Updated website data"
git push
exit 0
