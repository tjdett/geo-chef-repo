#
# Cookbook Name:: geo
# Recipe:: default
#
# Copyright 2012, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#

mypkgs = ["java-1.7.0-openjdk", "subversion", "python-pip"]

mypkgs.each do |p|
  package p
end

script "checkout_geo" do
  interpreter "bash"
  user "root"
  code <<-EOH
    cd /opt
    svn checkout https://uws-eresearch.googlecode.com/svn/trunk/geo geo
  EOH
  not_if do
    File.exists?("/opt/geo")
  end
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

script "mv_schema_to_solr" do
  interpreter "bash"
  user "root"
  code <<-EOH
    cp /opt/geo/schema.xml /opt/apache-solr-3.6.0/example/solr/conf/
    cd /opt/apache-solr-3.6.0/example/exampledocs
    rm *.xml
  EOH
  not_if do
    File.exists?("/opt/apache-solr-3.6.0/example/solr/conf/schema.xml")
  end
end

cookbook_file "/root/run_geo.sh" do
  action :create
  source "run_geo.sh"
end
  
 
