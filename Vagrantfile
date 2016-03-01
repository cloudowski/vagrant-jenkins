# -*- mode: ruby -*-
# vi: set ft=ruby :

# Vagrantfile API/syntax version. Don't touch unless you know what you're doing!
VAGRANTFILE_API_VERSION = "2"


Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|
  
  config.vm.box = "puppetlabs/centos-7.2-64-nocm"
  
  # disabled builtin rsync directory in centos/7 box
  config.vm.synced_folder ".", "/home/vagrant/sync", type: "rsync", disabled: true
    
  config.vm.provision :shell, :path => "scripts/common.sh"
  config.vm.provision :shell, :path => "scripts/jenkins.sh"

  config.vm.network "forwarded_port", guest: 8080, host: 8080
  config.vm.hostname = "jenkins.example.com"

  config.vm.synced_folder '.', '/vagrant'

end
