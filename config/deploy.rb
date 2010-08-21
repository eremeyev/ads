set :application, "gazeta"
set :deploy_to, "/home/admin/data/gazeta"
#set :use_sudo, true

default_run_options[:pty] = true
set :scm_password, Proc.new { Capistrano::CLI.password_prompt "SCM Password: "}

set :scm, :git
set :repository, "git@github.com:azazelo/gazeta"
set :branch, "master"

role :web, "78.24.222.238"                          # Your HTTP server, Apache/etc
role :app, "78.24.222.238"                          # This may be the same as your `Web` server
role :db,  "78.24.222.238", :primary => true # This is where Rails migrations will run

#ssh_options[:keys] = "C:\Documents and Settings\Admin\.ssh\id_rsa"
#ssh_options[:keys] = %w(/full/path/to/your/ssh_key/id_rsa)



#role :db,  "your slave db-server here"

# If you are using Passenger mod_rails uncomment this:
# if you're still using the script/reapear helper you will need
# these http://github.com/rails/irs_process_scripts

# namespace :deploy do
#   task :start do ; end
#   task :stop do ; end
#   task :restart, :roles => :app, :except => { :no_release => true } do
#     run "#{try_sudo} touch #{File.join(current_path,'tmp','restart.txt')}"
#   end
# end