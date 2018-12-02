#
# Cookbook:: kubernetes
# Recipe:: default
#
# Copyright:: 2018, The Authors, All Rights Reserved.

install_packages = ['lvm2', \
                    'wget', \
                    'device-mapper', \
                    'device-mapper-persistent-data', \
                    'device-mapper-event', \
                    'device-mapper-libs', \
                    'device-mapper-event-libs']

# yum update
execute 'yum update -y'

# install container-selinux (docker dependency)
execute 'install container-selinux' do
  command 'sudo yum install -y http://mirror.centos.org/centos/7/extras/x86_64/Packages/container-selinux-2.42-1.gitad8f0f7.el7.noarch.rpm'
  action :run
  not_if 'yum list installed | grep container-selinux'
end

# install EPEL (to install pigz)
execute 'install EPEL' do
  command "sudo yum install -y https://dl.fedoraproject.org/pub/epel/epel-release-latest-$(rpm -E '%{rhel}').noarch.rpm"
  action :run
  not_if 'yum list installed | grep epel-release'
end

# install docker's dependencies
package install_packages do
  action :install
end

# add docker repo
execute 'add docker-ce repo' do
  command 'wget https://download.docker.com/linux/centos/docker-ce.repo -O /etc/yum.repos.d/docker-ce.repo'
  action :run
end

# install docker
package 'docker-ce' do
  action :upgrade
end

# install docker-compose
execute 'install docker-compose' do
  command 'curl -L "https://github.com/docker/compose/releases/download/1.23.1/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose && chmod +x /usr/local/bin/docker-compose'
  action :run
end

# add docker-compose to path
execute 'add docker-compose to $PATH' do
  command 'export PATH=/usr/local/bin:$PATH'
  action :run
end

# start and enable docker service
service 'docker' do
  action [:start, :enable]
end





