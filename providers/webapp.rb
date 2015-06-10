require 'chef/mixin/shell_out'
include Chef::Mixin::ShellOut

action :deploy do
 log "My name is #{new_resource.name}"
 if @new_resource.name.nil? then Chef::Log.fatal "#{@new_resource} did not specify a project name, cannot run deploy without!" end

 cwd = @new_resource.cwd ? "cd \"#{@new_resource.cwd}\" & " : ""

 name = "#{new_resource.name}.deploy.cmd"
 trial = @new_resource.trial ? '/t' : '/y'
 skip_database_provider = @new_resource.skip_database_provider ? '"-skip:objectName=dbFullSql"' : ''
 case @new_resource.skip_web_configs
	when :none
	 	skip_web_configs = ''
	when :root 
 		skip_web_configs = '"-skip:objectName= filePath,absolutePath=\\\\ApplicationFolder\\\\web\.config$"'
	when :all
		skip_web_configs = '"-skip:objectName= filePath,absolutePath=\\\\ApplicationFolder\\\\[\w\s]+web\.config$"' 
	else
		skip_web_configs = ''
 end
 cmd = cwd
 cmd += "#{name} "
 cmd += "#{trial} "
 cmd += "#{skip_database_provider} " unless skip_database_provider.nil?
 cmd += "#{skip_web_configs} " unless skip_web_configs.nil?

 shell_out!(cmd, {:returns => [0]})

end