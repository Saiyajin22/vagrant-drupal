Vagrant.configure("2") do |config|
    config.vm.box = "ubuntu/jammy64"
    config.vm.network "forwarded_port", guest: 80, host: 8080, host_ip: "127.0.0.1"
  
    config.vm.provider "virtualbox" do |vb|
        vb.memory = "1024"
        vb.cpus = 1
        vb.name = "ubuntu_drupal"
        vb.gui = true
    end

    # Shell fájlok futtatása. Provision miatt csak első boot-nál!
    config.vm.provision "shell", path: "init.sh"
    # Bekapcsoláskor automatikusan megcsinál valamit. (Elindítja a drupalt)
    # ns.trigger.after [:up, :reload] do |t|
    #   t.run_remote = {inline: "cd express_example && forever start ./bin/www"}
    # end
end