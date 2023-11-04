Vagrant.configure("2") do |config|
    config.vm.box = "ubuntu/jammy64"
    config.vm.network "forwarded_port", guest: 80, host: 8080, host_ip: "127.0.0.1"
    config.vm.network "forwarded_port", guest: 3306, host: 8081, host_ip: "127.0.0.1"
  
    config.vm.provider "virtualbox" do |vb|
        vb.memory = "2048"
        vb.cpus = 2
        vb.name = "drupal_ubuntu"
        vb.gui = true
    end

    # Shell fájlok futtatása. Provision miatt csak első boot-nál!
    config.vm.provision "shell", path: "init.sh"
end