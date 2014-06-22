# -*- mode: ruby -*-
# vi: set ft=ruby :
Vagrant.configure("2") do |config|
 
 config.vm.define :node1 do |agent|
     config.vm.provider :virtualbox do |vb|
       vb.customize ["modifyvm", :id, "--memory", 5120]
     end
     agent.vm.hostname = "cloudack-mnds1-1.hdp.net"
     agent.vm.box = "centos"
     agent.vm.box_url = "http://developer.nrel.gov/downloads/vagrant-boxes/CentOS-6.4-x86_64-v20130731.box"
     agent.vm.network :private_network, ip: "192.168.33.11"
     agent.vm.network :forwarded_port, host: 7000, guest: 50070
     agent.vm.network :forwarded_port, host: 7001, guest: 8088
     agent.vm.network :forwarded_port, host: 7002, guest: 60010
     agent.vm.synced_folder "vm", "/etc/share/vm"
     agent.vm.provision :shell, :path => "otsdb_kickstart.sh"


 end
end

