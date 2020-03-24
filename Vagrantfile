# -*- mode: ruby -*-
# vi: set ft=ruby :

# Vagrantfile API/syntax version. Don't touch unless you know what you're doing!
VAGRANTFILE_API_VERSION = "2"
#Check if you have the good Vagrant version to use docker provider...
Vagrant.require_version ">= 1.6.0"

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|
  ENV['VAGRANT_DEFAULT_PROVIDER'] = 'docker'

  config.vm.box_check_update = false

  config.vm.network "forwarded_port", guest: 8080, host: 8080
  
  if Vagrant::Util::Platform.windows?
    config.vm.synced_folder ENV['USERPROFILE'], "/home/coder", docker_consistency: "consistent"
  else
    config.vm.synced_folder ENV['HOME'], "/home/coder", docker_consistency: "consistent"
  end

  config.vm.provider "docker" do |d|
    d.image = "registry.gitlab.com/softrams-public/vscode-docker"
    d.env = {
      "PASSWORD" => "softrams"
    }
  end
end
