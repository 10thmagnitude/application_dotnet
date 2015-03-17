application_dotnet
================
Provides a set of .NET primitives (Chef resources) meant to aid in the deployment of .NET applications on the Windows platform


Requirements
-------------
Currently only tested on chef-client >=12

### Platforms
* Windows 2012R2

Attributes
----------
TBD

Resource/Provider
-----------------
### dotnet_webapp
#### Actions
- :create: Create a .NET web application

#### Attribute Parameters
- :name: Name attribute. The name of application

#### Examples
Create a .NET web app

```ruby
donet_webapp 'MyWebApp' do
  action  :create
end
```

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