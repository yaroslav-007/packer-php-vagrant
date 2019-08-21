

# Simple vagrant
This is project that runs simple php web page via vagrant.

## Pre-requirements

**Install Vagrant:**
Download and install accordingly to your OS as described here:
https://www.vagrantup.com/downloads.html

**Install Packer:**
Download and install accordingly to your OS as described here:
https://www.packer.io/downloads.html


**Install rbenv:**


On Linux:
> Note:
> On Graphical environments, when you open a shell, sometimes `~/.bash_profile` doesn't get loaded
> You may need to `source ~/.bash_profile` manually or use `~/.bashrc`

```
apt update
apt install autoconf bison build-essential libssl-dev libyaml-dev libreadline6-dev zlib1g-dev libncurses5-dev libffi-dev libgdbm5 libgdbm-dev
wget -q https://github.com/rbenv/rbenv-installer/raw/master/bin/rbenv-installer -O- | bash
echo 'export PATH="$HOME/.rbenv/bin:$PATH"' >> ~/.bash_profile
source ~/.bash_profile
rbenv init
echo 'eval "$(rbenv init -)"' >> ~/.bash_profile
source ~/.bash_profile
```
On MacOS:
```
brew install rbenv
echo 'export PATH="$HOME/.rbenv/bin:$PATH"' >> ~/.bash_profile
source ~/.bash_profile
rbenv init
echo 'eval "$(rbenv init -)"' >> ~/.bash_profile
source ~/.bash_profile
```

On Windows:
Install accordingly to https://rubyinstaller.org/

## How to run the code


 OS system | Operation
 ------------ | -------------
| Windows | Start menu -> Run and type cmd |
| Linux  |Start terminal |
| macOS | Press Command - spacebar to launch Spotlight and type "Terminal," then double-click the search result. |

## Clone the code locally:

    git clone https://github.com/yaroslav-007/packer-php-vagrant.git
    cd packer-php-vagrant

## Start vagrant:

    packer build bionic64.json
 

When done file named bionic64-vbox.box will be generated.

## Kitchen test
### Pre-requirements
```
rbenv install 2.5.1
rbenv local 2.5.1
rbenv versions
gem install bundler
bundle install
```

  

### Build

```
make
```

### Test
```
bundle exec kitchen converge
bundle exec kitchen verify
bundle exec kitchen destroy
```

You should get:

```
    -----> Starting Kitchen (v1.23.2)
    -----> Verifying <default-vbox-bionic64>...
           Loaded tests from {:path=>".home.hpeymark.packer-php-vagrant.test.integration.default"} 
    
    Profile: tests from {:path=>"/home/hpeymark/packer-php-vagrant/test/integration/default"} (tests from {:path=>".home.hpeymark.packer-php-vagrant.test.integration.default"})
    Version: (not specified)
    Target:  ssh://vagrant@127.0.0.1:2222
    
      ubuntu
         ✔  should eq "ubuntu"
      18.04
         ✔  should eq "18.04"
      System Package nginx
         ✔  should be installed
      System Package php-fpm
         ✔  should be installed
      Service php7.2-fpm
         ✔  should be installed
         ✔  should be enabled
         ✔  should be running
      Service nginx
         ✔  should be installed
         ✔  should be enabled
         ✔  should be running
      File /etc/nginx/sites-enabled/default
         ✔  should not exist
    
    Test Summary: 11 successful, 0 failures, 0 skipped
           Finished verifying <default-vbox-bionic64> (0m1.06s).
    -----> Kitchen is finished. (0m2.23s)
```

## Publish to Vagrant Cloud
```
vagrant cloud publish vatman/bionic64-php 0.0.1 virtualbox bionic64-php-vbox.box --release --force
```
