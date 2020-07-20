# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure("2") do |config| 
	
	config.vm.define "centos" do |centos|
		centos.vm.box = "generic/centos7"
		centos.vm.hostname = "centos" 
		centos.vm.network "private_network", ip: "192.168.33.10" 
		centos.vm.provider "virtualbox" do |vb| 
			vb.name = "centos" 
			vb.gui = false 
			vb.memory = "512" 
			vb.cpus = 1 
		end 
		centos.vm.provision "shell", path: "provisionCentos.sh"
	end
	

	config.vm.define "ubuntu" do |ubuntu|
		ubuntu.vm.box = "generic/ubuntu2004"
		ubuntu.vm.hostname = "ubuntu" 
		ubuntu.vm.network "private_network", ip: "192.168.33.20" 
		ubuntu.vm.provider "virtualbox" do |vb| 
			vb.name = "ubuntu" 
			vb.gui = false 
			vb.memory = "512" 
			vb.cpus = 1 
		end 
		ubuntu.vm.provision "shell", path: "provisionUbuntu.sh"
	end
end
