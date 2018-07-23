# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure(2) do |config|
  config.vm.box = "base"
	config.vm.define "joomla" do |joomla|
    joomla.vm.box = "ubuntu/trusty64"
		joomla.vm.hostname = "DOTNET"
		joomla.vm.network "private_network", ip: "192.168.38.15"		
		joomla.vm.network "forwarded_port", guest: 5000, host: 8081
		joomla.vm.synced_folder "/VMs/CORE/Gratitude_WebServices", "/home/vagrant/Gratitude_WebServices"
		joomla.vm.provision :shell, path: "provision.sh"
		joomla.vm.provider :virtualbox do |vb|
        vb.name = "DOTNET"				
				vb.customize ["modifyvm", :id, "--description", "You can access DOTNET using the following URL: http://192.168.38.15:5000"]
    end
  end
end