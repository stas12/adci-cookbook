#
# Cookbook Name:: phpapp
# Recipe:: default
#
# Copyright 2013, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#

include_recipe "nginx"
include_recipe "php-fpm"
include_recipe "mysql::client"
include_recipe "mysql::server"

if node[:phpapp].has_key(:hosts)
  node[:phpapp][:hosts].each do |site|
    template "/etc/nginx/sites-available/#{site}.conf" do
      source "nginx.conf.erb"
      mode "0640"
      owner "root"
      group "root"
      variables(
                :server_name => site,
                :server_aliases => ["*.#{site}"],
                :docroot => "#{node[:doc_root]}/var/www/#{site}",
                :logdir => "#{node[:nginx][:log_dir]}"
                )
    end

    nginx_site "#{site}.conf" do
      :enable
    end
  end
end
