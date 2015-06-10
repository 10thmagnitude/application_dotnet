#
# Cookbook Name:: application_dotnet
# Recipe:: default
#
# Copyright:: 2015, 10th Magnitude <info@10thmagnitude.com>
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

include_recipe "iis"
include_recipe "iis::mod_aspnet45"

windows_package "WebDeploy" do
    source "https://www.dropbox.com/s/6c6e7vup33ctod8/WebDeploy_amd64_en-US.msi?dl=1"
  action :install
end

iis_site "Default Web Site" do
  action :delete
end

directory "#{node['iis']['docroot']}/ApplicationDotNetSample" do
  action :create
end

iis_pool "AppDotNetSample" do
   runtime_version "4.0"
   pipeline_mode :Integrated
   action :add
end

iis_site "AppDotNetSite" do
  path "#{node['iis']['docroot']}"
    action [:add, :start]
end

iis_app "AppDotNetSample" do
  site_name "AppDotNetSite"
  path "/AppDotNetSample"
  application_pool "AppDotNetSample"
  physical_path "#{node['iis']['docroot']}/ApplicationDotNetSample"
  enabled_protocols "http,net.pipe"
  action :add
end

windows_zipfile "C:/Sample" do
  source "https://www.dropbox.com/s/fbvnef9fqvse01q/WebDeploySample.zip?dl=1"
  overwrite true
  action :unzip
end

application_dotnet_webapp "ApplicationDotNetSample" do
  cwd "C:/Sample"
  action :deploy
end
