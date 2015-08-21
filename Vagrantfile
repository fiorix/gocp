# Copyright 2015 gocp authors. All rights reserved.
# Use of this source code is governed by a BSD-style license that can be
# found in the LICENSE file.

Vagrant.configure(2) do |config|
	config.vm.box = "ubuntu/trusty64"
	config.vm.provider :virtualbox do |vb, override|
		vb.cpus = 2
		vb.memory = 2048
		vb.customize ["modifyvm", :id, "--natdnsproxy1", "off"]
	end

	# Provision.
	config.vm.provision :shell, :privileged => false,
		:path => "scripts/vagrant-provision.sh"

	# Set directories.
	config.vm.synced_folder ".", "/vagrant", disabled: true
	config.vm.synced_folder ".", "/home/vagrant/src/github.com/fiorix/gocp",
		owner: "vagrant", group: "vagrant"
end
