#
# Cookbook Name:: geo
# Recipe:: default
#
# Copyright 2012, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#

mypkgs = ["java-1.7.0-openjdk", "subversion"]

mypkgs.each do |p|
  package p
end

script "extract_solr" do
  interpreter "bash"
  user "root"
  code <<-EOH
    cd /opt
    wget http://apache.mirror.uber.com.au/lucene/solr/3.6.0/apache-solr-3.6.0.tgz
    tar xzvf apache-solr-3.6.0.tgz
  EOH
  not_if do
    File.exists?("/opt/apache-solr-3.6.0")
  end
end 
