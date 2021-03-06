# config valid only for current version of Capistrano
set :stages, ['beta', 'staging', 'release']
lock '3.4.0'

set :application, 'retina-data'
set :repo_url, 'git@github.com:akmumu/retina-hash.git'
set :deploy_user, 'admin'
set :deploy_to, "/home/#{fetch(:deploy_user)}/akmumu/www/#{fetch(:application)}"
set :scm, :git
set :keep_releases, 10
set :pty, true
set :linked_dirs, %w{bin log tmp/pids tmp/cache tmp/sockets vendor/bundle public/system}
# set :linked_files, %w{config/database.yml config/database.yml}
set :tmp_dir, "#{shared_path}/tmp"

set :unicorn_pid, "#{shared_path}/tmp/unicorn.retina-data.pid"
set :unicorn_config_path, "#{current_path}/config/unicorn.rb"

set :log_root, "#{shared_path}/log"

set :assets_upload_roles, [:asset_upload]
# Default branch is :master
# ask :branch, `git rev-parse --abbrev-ref HEAD`.chomp

# Default value for :log_level is :debug
set :log_level, :debug

# Default value for :pty is false
# set :pty, true

# Default value for :linked_files is []
# set :linked_files, fetch(:linked_files, []).push('config/database.yml', 'config/secrets.yml')

# Default value for linked_dirs is []
# set :linked_dirs, fetch(:linked_dirs, []).push('log', 'tmp/pids', 'tmp/cache', 'tmp/sockets', 'vendor/bundle', 'public/system')

# Default value for default_env is {}
# set :default_env, { path: "/opt/ruby/bin:$PATH" }

namespace :deploy do

  after :restart, :clear_cache do
    on roles(:web), in: :groups, limit: 3, wait: 10 do
      # Here we can do anything such as:
      # within release_path do
      #   execute :rake, 'cache:clear'
      # end
    end
  end

end
