#!/usr/bin/env sh

site="${1:-arba_hon}"
co="${site:0:2}"
iata="${site:5:8}"
osver=`lsb_release -r -s | awk -F "." '{print $1}'`

if [ ! -z ${http_proxy} ];then
  echo "proxy=${http_proxy}" >> /etc/yum.conf
  options="-x ${http_proxy}"
fi

if ! grep -qE "^CentOS" /etc/redhat-release; then
   curl ${options} -s http://pub.example.com/redhat/custom-os.repo -o /etc/yum.repos.d/custom-os.repo
   sed -i -e "s/\$osversion/${osver}/g" /etc/yum.repos.d/custom-os.repo
   curl ${options} -s http://pub.example.com/redhat/custom-supplementary.repo -o /etc/yum.repos.d/custom-supplementary.repo
   sed -i -e "s/\$osversion/${osver}/g" /etc/yum.repos.d/custom-supplementary.repo
fi

curl ${options} -s http://pub.example.com/redhat/custom-extras.repo -o /etc/yum.repos.d/custom-extras.repo
sed -i -e "s/\$osversion/${osver}/g" /etc/yum.repos.d/custom-extras.repo

yum -y install python-markupsafe salt-minion
sed -i -e "s/#master:.*/master: salt.prd.srv.${iata,,}.${co,,}.internal/g" /etc/salt/minion

service salt-minion restart
