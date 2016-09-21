#!/bin/bash
yum install -y epel-release
yum install -y puppet
service puppet start
rpm -Uvh https://yum.puppetlabs.com/puppetlabs-release-pc1-el-7.noarch.rpm
puppet apply /vagrant/manifest/puppet.pp

              
