# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure("2") do |config|

	config.vm.define "master" do |master|
        master.vm.box = "centos/7"
        master.vm.hostname = "master"
        master.vm.network "private_network", ip: "192.168.25.200"
	
        master.vm.provider "virtualbox" do |machine|
		machine.cpus = 1		
		machine.memory = 4096
                machine.name = "master"
                end
	master.vm.provision "shell", path: "shell.sh"
        end

	config.vm.define "agent" do |agent|
	agent.vm.box = "centos/7"
	agent.vm.hostname = "agent"
	agent.vm.network "private_network", ip: "192.168.25.201"
	
	agent.vm.provider "virtualbox" do |machine|	
		machine.cpus = 1
		machine.memory = 1024
		machine.name = "agent"
		end
	agent.vm.provision "shell", path: "shell.sh"
	end

	config.vm.synced_folder "/", "/home/Student/Desktop/AECM/CM_Puppet/exittask",
        owner:"vagrant", group:"vagrant",
        create:true
	
end
