default: all


all: kitchen

bionic64-vbox.box: bionic64.json ../scripts/packages.sh http/preseed.cfg
	packer validate bionic64.json
	packer build -force -only=bionic64-vbox bionic64.json


kitchen-vbox: bionic64-vbox.box
	bundle exec kitchen test vbox


kitchen: kitchen-vbox

.PHONY: clean
clean:
	-vagrant box remove -f bionic64 --provider virtualbox
	-vagrant box remove -f bionic64 --provider vmware_desktop
	-rm -fr output-*/ *.box
