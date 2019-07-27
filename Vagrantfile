# Do everything that is prefixed with "config." with Vagrant.configure("2")
Vagrant.configure("2") do |config|
    
    # Set vm name
    config.vm.define "fricloudtest"
    
	# Set hostname
	config.vm.hostname = "fricloudtest"
    
    # Use Debian Stretch, go here for version change: https://app.vagrantup.com/debian
    config.vm.box = "debian/stretch64"
    config.vm.synced_folder ".", "/vagrant", type: "rsync", rsync__exclude: ".git/"

    # Set memory
    config.vm.provider :libvirt do |v|
        v.memory = 3072
    end
    
    # Run cert generation
    config.vm.provision "shell", path: "genTestCertGuest.sh"
    
    # Do everything that is prefixed with "ansible." with ansible
    config.vm.provision :ansible do |ansible|
        ansible.playbook = 'local.yml'
        ansible.host_key_checking = false
    end

end
