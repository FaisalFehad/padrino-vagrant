# -*- mode: ruby -*-
# vi: set ft=ruby :

# Vagrantfile API/syntax version. Don't touch unless you know what you're doing!
VAGRANTFILE_API_VERSION = "2"

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|
  # Every Vagrant virtual environment requires a box to build off of.
  config.vm.box = "hashicorp/precise64"
  config.vm.hostname = "machine-one"

  # Create a private network, which allows host-only access to the machine
  # using a specific IP.
  config.vm.network "private_network", ip: "192.168.50.4"

  # If true, then any SSH connections made will enable agent forwarding.
  # Default value: false
  config.ssh.forward_agent = true

  config.vm.provider "virtualbox" do |vb|
    # Don't boot with headless mode
    vb.gui = false

    vb.customize ["modifyvm", :id, "--memory", "512"]
  end

  config.vm.provision :shell, path: 'bootstrap.sh', keep_color: true
end
