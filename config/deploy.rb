set :application, "fb-shanghai"
set :repository,  "git@github.com:mmichael0413/fb-shanghai.git"

set :scm, :git # You can set :scm explicitly or Capistrano will make an intelligent guess based on known version control directory names
# Or: `scm`, `accurev`, `bzr`, `cvs`, `darcs`, `git`, `mercurial`, `perforce`, `subversion` or `none`

# set :location, "fb-shanghai.cloudapp.net"

set :branch, "master"
# to force cap to reuse single remote git clone instead of creating a new one with each 'cap deploy'
set :deploy_via, :remote_cache

set :user, "mmichaelevich"
set :use_sudo, false

ssh_options[:forward_agent] = true
default_run_options[:pty] = true

# use 'server' instead of 'role' for a single server
# server "fb-shanghai.cloudapp.net", :app, :web, :db, :primary => true

# Also tried using roles instead of 'server' but that prompts a password that I can not get passed
role :web, "168.63.237.104"                          # Your HTTP server, Apache/etc
role :app, "168.63.237.104"                          # This may be the same as your `Web` server
role :db, "168.63.237.104", :primary => true
# role :db,  "v1o64h7a79.database.windows.net", :primary => true # This is where Rails migrations will run
# role :db,  "your slave db-server here"

# if you want to clean up old releases on each deploy uncomment this:
after "deploy:restart", "deploy:cleanup"

# automatically run db migrations after each 'cap deploy'
after "deploy:update_code", "deploy:migrate"

# if you're still using the script/reaper helper you will need
# these http://github.com/rails/irs_process_scripts

# If you are using Passenger mod_rails uncomment this:
# namespace :deploy do
#   task :start do ; end
#   task :stop do ; end
#   task :restart, :roles => :app, :except => { :no_release => true } do
#     run "#{try_sudo} touch #{File.join(current_path,'tmp','restart.txt')}"
#   end
# end