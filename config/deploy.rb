require "bundler/capistrano"
 
set :application, "fb-shanghai"
set :user, "mmichaelevich"
 
set :scm, :git
set :repository, "git@github.com:mmichael0413/fb-shanghai.git"
set :branch, "master"
set :use_sudo, false # use false for cap deploy:setup, every other time use true
 
server "168.63.249.187", :web, :app, :db, primary: true
set :port, "58386"
 
set :deploy_to, "/home/#{user}/apps/#{application}"
default_run_options[:pty] = true
ssh_options[:forward_agent] = true # uses local ssh keys for authentication with git repo
#ssh_options[:keys] = ["/Users/mikemichaelevich/Programs/Fullbridge/myCert.pem"]
 
#namespace :deploy do
#  %w[start stop restart].each do |command|
#    desc "#{command} unicorn server"
#    task command, roles: :app, except: {no_release: true} do
#      run "/etc/init.d/unicorn_#{application} #{command}"
#    end
#  end
# 
#  task :setup_config, roles: :app do
#    sudo "ln -nfs #{current_path}/config/nginx.conf /etc/nginx/sites-enabled/#{application}"
#    sudo "ln -nfs #{current_path}/config/unicorn_init.sh /etc/init.d/unicorn_#{application}"
#    sudo "mkdir -p #{shared_path}/config"
#  end
#  after "deploy:setup", "deploy:setup_config"
# 
#  task :symlink_config, roles: :app do
#    # Add database config here
#  end
#  after "deploy:finalize_update", "deploy:symlink_config"
#end