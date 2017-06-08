#!/bin/bash
echo "###Install httpd.2.4.25 ###"
echo "###add repo ###"
cd /etc/yum.repos.d && wget https://repo.codeit.guru/codeit.el`rpm -q --qf "%{VERSION}" $(rpm -q --whatprovides redhat-release)`.repo
yum repolist
echo "###install httpd####"
yum install httpd-2.4.25-1.el7.codeit.x86_64
echo "###setting setsebool###"
setsebool -P httpd_execmem=1
echo "###start httpd###"
systemctl start httpd
echo "###enable httpd###"
systemctl enable httpd
echo "###check Version httpd###"
httpd -V