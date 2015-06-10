application_dotnet
================
Provides a set of .NET primitives (Chef resources) meant to aid in the deployment of .NET applications on the Windows platform

Currently this cookbook supports the deployment of .NET Web Deploy Packages


Requirements
-------------
Currently only tested on chef-client >=12

You must set up your IIS Web Server before calling using the dotnet_webapp deployment resource.
Including:
	-App Pool
	-Web Site
	-Application

You must move your Web Deploy Package onto the target node. This is accomplished using windows_zipfile in the test recipe. This will change in future versions.

When generating the Web Deploy Package, make sure that the site name you provide includes any pathing. For example if you're referencing an application that exists under a website you should set the site name to <SiteName>/<AppName>.

### Platforms
* Windows 2012R2

Attributes
----------
TBD

Resource/Provider
-----------------
### webapp
#### Actions
- :deploy: deploy a .NET web application

#### Attribute Parameters
- :name: Name attribute. The name of web deploy package.
- :cwd: Changes working directory (allows us to get to the same directory that we unzipped the package), default nil
- :trial: Sets flag for whether or not to run deployment in trial mode, default false
- :skip_database_provider Adds logic to skip database provider, default false
- :skip_web_configs: chooses which web configs, if any, should be skipped. Options :none, :root, :all

More details about the attributes can be found in the Microsoft deploy with deploy.cmd file guide. [How to: Install a Deployment Package Using the deploy.cmd File](https://msdn.microsoft.com/en-us/library/vstudio/ff356104)

#### Examples
Deploy a .NET web app

```ruby
application_dotnet_webapp "ApplicationDotNetSample" do 
	cwd "C:/Sample"
	action :deploy
end
```

Sample
-----------------
The sample recipe inclued in the test fixture will host the test application at localhost/AppDotNetSample

License & Authors
-----------------
- Author:: Trevor Hess (<thess@10thmagnitude.com>)
- Author:: Matt Stratton (<matt.stratton@gmail.com>)


```text
Copyright 2015, 10th Magnitude


Licensed under the Apache License, Version 2.0 (the "License");
you may not use this file except in compliance with the License.
You may obtain a copy of the License at

    http://www.apache.org/licenses/LICENSE-2.0

Unless required by applicable law or agreed to in writing, software
distributed under the License is distributed on an "AS IS" BASIS,
WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
See the License for the specific language governing permissions and
limitations under the License.
```
