# -*- mode: ruby -*-
# vi: set ft=ruby :

# Vagrantfile API/syntax version. Don't touch unless you know what you're doing!
VAGRANTFILE_API_VERSION = "2"

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|
    config.vm.box = "ubuntu/trusty64"
    config.vm.box_url = "https://atlas.hashicorp.com/ubuntu/boxes/trusty64"
    config.vm.network :private_network, ip: "192.168.10.10"

    # VirtualBox Settings
    config.vm.provider "virtualbox" do |vb|
      vb.name = 'workroom'
    end

    config.vm.provision :shell, :path => "install.sh"

    config.vm.synced_folder "../", "/home/vagrant/Code", :mount_options => ["dmode=777", "fmode=666"]

end
