# -*- mode: ruby -*-
# vi: set ft=ruby :

require 'getoptlong'

ansibleTags=''
ansibleSkipTags=''

begin
   opts = GetoptLong.new(
     [ '--tags', GetoptLong::OPTIONAL_ARGUMENT ],
     [ '--skip-tags', GetoptLong::OPTIONAL_ARGUMENT ]
   )

   opts.quiet = true

   opts.each do |opt, arg|
     case opt
       when '--tags'
         ansibleTags=arg
       when '--skip-tags'
         ansibleSkipTags=arg
     end
   end
rescue Exception => ignored
#Ignore to allow other opts to be passed to Vagrant
end

puts " Running with ansible-tags: " + ansibleTags.split(",").to_s if ansibleTags != ''
puts " Running with ansible-skip-tags: " + ansibleSkipTags.split(",").to_s if ansibleSkipTags != ''

hosts = [{
   hostname: "host1",
   ip: "192.168.33.11",
   memory: "2048",
   cpus: 1,
   promisc: 2
},{
   hostname: "host2",
   ip: "192.168.33.12",
   memory: "2048",
   cpus: 1,
},{
   hostname: "host3",
   ip: "192.168.33.13",
   memory: "2048",
   cpus: 1,
}]


Vagrant.configure("2") do |config|
  config.vm.box = "centos/7"
  config.ssh.insert_key = true
  config.hostmanager.enabled = true
  config.hostmanager.manage_host = true
  config.vm.box_check_update = false

  hosts.each_with_index do |host, index|
    config.vm.define host[:hostname] do |node|
      node.vm.hostname = host[:hostname]
      node.vm.network "private_network", ip: host[:ip]
      node.vm.provider "virtualbox" do |vb|
        vb.memory = host[:memory]
        vb.cpus = host[:cpus]
        if host.has_key?(:promisc)
          vb.customize ["modifyvm", :id, "--nicpromisc#{host[:promisc]}", "allow-all"]
        end
        # disable audio, so that the vm doesn't capture the sound / mic
        vb.customize ["modifyvm", :id, "--audio", "none"]
      end
    end
  end

  config.vm.provision :ansible do |ansible|
    ansible.become = true
    ansible.compatibility_mode = "2.0"
    ansible.playbook = "install/playbook.yml"
    ansible.inventory_path = "install/inventory"
    ansible.tags = ansibleTags.split(",") if ansibleTags != ''
    ansible.skip_tags = ansibleSkipTags.split(",") if ansibleSkipTags != ''
  end
end

