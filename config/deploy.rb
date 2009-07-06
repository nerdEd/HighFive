default_run_options[:pty] = true

# Target server settings
set :user, 'nerded'
set :domain, 'nerded.net'

# GitHub settings
set :application, 'HighFive'
set :github_name, 'nerdEd'

set :repository,  "git://github.com/nerdEd/HighFive.git"
set :deploy_to, "/home/#{user}/highfive.edschmalzle.com"
set :deploy_via, :remote_cache
set :scm, 'git'
set :branch, 'master'
set :git_shallow_clone, 1
set :scm_verbose, true
set :use_sudo, false

server domain, :app, :web
role :db, domain, :primary => true

namespace :deploy do
  
  task :after_symlink do
    run "cp /home/nerded/highfive.edschmalzle.com/shared/config.yml #{current_path}/config/config.yml"
    run "cd #{current_path}"
    # run "rake highfive:score RAILS_ENV=production"
  end
  
  task :restart do
    run "touch #{current_path}/tmp/restart.txt" 
  end
  
end