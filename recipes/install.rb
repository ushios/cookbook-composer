#
# Cookbook Name:: composer
# Recipe:: install
#
# Copyright 2013, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#

wd = node['composer']['working_directory']

package 'curl' do
	action :install
end
	
directory wd do
	owner "root"
	group "root"
	mode 0755
	action :create
	recursive true
end

execute 'install php composer' do
	command "curl -s http://getcomposer.org/installer | php "
	cwd "/usr/local/bin"
	creates '/usr/local/bin/composer.phar'
	user "root"
	group "root"
	action :run
end

execute 'chmod' do
	command 'chmod a+x /usr/local/bin/composer.phar'
	user "root"
	group "root"
	action :run
end

link '/usr/local/bin/composer' do
	to "/usr/local/bin/composer.phar"
end
