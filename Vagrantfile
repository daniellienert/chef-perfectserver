Vagrant.configure("2") do |config|
  config.vm.box = "ubuntu13"
  config.vm.box_url = "http://cloud-images.ubuntu.com/raring/current/raring-server-cloudimg-vagrant-amd64-disk1.box"

  config.vm.provider "virtualbox" do |v|
    v.name = "Ubuntu_Server"
    v.customize ["modifyvm", :id, "--memory", 1024]
  end

#  config.vm.provision :shell, :path => "bootstrap.sh"

  config.vm.provision :chef_solo do |chef|

    # This path will be expanded relative to the project directory
    chef.cookbooks_path = ["cookbooks", "site-cookbooks"]
    chef.data_bags_path = "data_bags"

    # Enable apt-get package
    chef.add_recipe "server"

  end

  # Do some post provisioning
#  config.vm.provision :shell, :path => "post_provision.sh"

#  config.vm.synced_folder "~/Workspace", "/var/workspace", :nfs => true

  config.vm.hostname = "dev.box"
  config.vm.network :private_network, ip: "192.168.164.123"

end