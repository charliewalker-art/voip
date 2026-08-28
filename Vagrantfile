Vagrant.configure("2") do |config|
  config.vm.box = "madebian12"
  config.vm.box_url = "https://github.com/charliewalker-art/boxe-image-debian/releases/download/v1.0.0/package.box"
  config.vm.hostname = "Voip"

  # Réseau privé : IP dédiée à la VM, plus stable que le bridge Wi-Fi
  # (accessible depuis ta machine hôte, pas depuis tout le LAN)
  config.vm.network "private_network", type: "dhcp"

  config.vm.provider "virtualbox" do |vb|
    vb.name   = "Voip2"
    vb.memory = "2000"
    vb.cpus   = 1
  end

  # Installation d'Ansible et dépendances sur la VM
  config.vm.provision "shell", inline: <<-SHELL
    export DEBIAN_FRONTEND=noninteractive
    apt-get update -qq
    apt-get install -y software-properties-common curl git python3-pip htop
    apt-get install -y ansible python3-debian
  SHELL


  config.vm.provision "ansible_local" do |ansible|
   ansible.playbook = "asterisk/00_asterisk_install.yml"
 end

   config.vm.provision "ansible_local" do |ansible|
    ansible.playbook = "postgresql/01_postgresql_install.yml"
  end


 config.vm.provision "ansible_local" do |ansible|
  ansible.playbook = "connexion-db-asterisk/02_odbc_pjsip_config.yml"
end
 

config.vm.provision "ansible_local" do |ansible|
  ansible.playbook = "database/03_database_schema.yml"
end


config.vm.provision "ansible_local" do |ansible|
  ansible.playbook = "piper/04_piper_install.yml"
end

config.vm.provision "ansible_local" do |ansible|
  ansible.playbook = "agi-scripts/05_agi_scripts.yml"
end

config.vm.provision "ansible_local" do |ansible|
  ansible.playbook = "a2billing/06_a2billing_install.yml"
end

config.vm.provision "ansible_local" do |ansible|
  ansible.playbook = "confbridge/07_confbridge_conference.yml"
end

config.vm.provision "ansible_local" do |ansible|
  ansible.playbook = "dialplan/08_dialplan.yml"
end

config.vm.provision "ansible_local" do |ansible|
  ansible.playbook = "verify/09_restart_and_verify.yml"
end

config.vm.provision "ansible_local" do |ansible|
  ansible.playbook = "api-auth/10_api_auth_db.yml"
end


config.vm.provision "ansible_local" do |ansible|
  ansible.playbook = "installation-docker/install_docker.yml"
end


config.vm.provision "ansible_local" do |ansible|
  ansible.playbook = "network-access/open_postgresql_network.yml"
end


config.vm.provision "ansible_local" do |ansible|
  ansible.playbook = "api-deployment/api_deployment.yml"
end


config.vm.provision "ansible_local" do |ansible|
  ansible.playbook = "timezone/timezone_config.yml"
end




end