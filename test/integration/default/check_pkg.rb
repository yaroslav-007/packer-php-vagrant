####Test OS
describe os.name do
  it { should eq 'ubuntu' }
end

describe os.release do
  it { should eq '18.04' }
end
####Test installed packets
describe package('nginx') do
  it { should be_installed }
end

describe package('php-fpm') do
  it { should be_installed }
end

describe service('php7.2-fpm') do
  it { should be_installed }
  it { should be_enabled }
  it { should be_running }
end

####Check nginx service
describe service('nginx') do
  it { should be_installed }
  it { should be_enabled }
  it { should be_running }
end

describe file('/etc/nginx/sites-enabled/default') do
  it { should_not exist }
end
