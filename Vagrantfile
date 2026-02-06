# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure("2") do |config|
  config.vm.box = "debian/bookworm64"
  if Vagrant.has_plugin?("vagrant-vbguest")
    config.vbguest.auto_update = false
    config.ssh.insert_key = false
  end
  config.vm.hostname = "hugo.evandi"
  config.vm.network "private_network", ip: "192.168.56.118"
  config.vm.provider "virtualbox" do |vb|
    vb.memory = "1024"
    vb.gui = false
    vb.name = config.vm.hostname
    vb.check_guest_additions = false
  end

  config.vm.provision "ansible" do |ansible|
      ansible.compatibility_mode = "2.0"
      ansible.playbook = "playbook_ansible.yml"
  end
end
