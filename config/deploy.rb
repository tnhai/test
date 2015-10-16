set :application, 'untitled'
# config valid only for current version of Capistrano
lock '3.4.0'

# Git depot
set :scm, :git
set :git_account, 'tnhai'
set :repository,  "git@github.com:tnhai/test.git"

# Deploy server
set :user, "sitadmin"
set :scm_passphrase, "securepassword"
set :domain, 'server.example.org'
set :server_hostname, 'server.example.org'
set :webapp_launch_id, "org.example.webapp.untitle"


role :web, server_hostname
role :app, server_hostname
role :db, server_hostname, :primary => true

default_run_options[:pty] = true

ssh_options[:forward_agent] = true
set :branch, "master"
set :deploy_via, :remote_cache
set :use_sudo, false
set :deploy_to, "/Users/#{user}/#{application}"

load 'deploy/assets'

before 'deploy:update_code', 'deploy:stop_web_app'
after 'deploy:symlink', 'deploy:symlink_thin_config'
after 'deploy:symlink', 'deploy:start_web_app'
# role :db, "db.somethingelse.com", :primary => true

# set :application, 'my_app_name'
# set :repo_url, 'git@example.com:me/my_repo.git'

# Default branch is :master
# ask :branch, `git rev-parse --abbrev-ref HEAD`.chomp

# Default deploy_to directory is /var/www/my_app_name
# set :deploy_to, '/var/www/my_app_name'

# Default value for :scm is :git
# set :scm, :git

# Default value for :format is :pretty
# set :format, :pretty

# Default value for :log_level is :debug
# set :log_level, :debug

# Default value for :pty is false
# set :pty, true

# Default value for :linked_files is []
# set :linked_files, fetch(:linked_files, []).push('config/database.yml', 'config/secrets.yml')

# Default value for linked_dirs is []
# set :linked_dirs, fetch(:linked_dirs, []).push('log', 'tmp/pids', 'tmp/cache', 'tmp/sockets', 'vendor/bundle', 'public/system')

# Default value for default_env is {}
# set :default_env, { path: "/opt/ruby/bin:$PATH" }

# Default value for keep_releases is 5
# set :keep_releases, 5

