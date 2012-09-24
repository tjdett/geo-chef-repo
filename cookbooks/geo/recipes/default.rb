#
# Cookbook Name:: geo
# Recipe:: default
#
# Copyright 2012, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#

mypkgs = ["java-1.7.0-openjdk", "subversion"]

mypkgs.each {|p| package p }
