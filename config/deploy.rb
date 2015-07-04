# config valid only for current version of Capistrano
lock '3.4.0'

set :application, 'ksot_srv'
set :repo_url, 'git@github.com:kowsan/ksot-srv.git'

# Default branch is :master
# ask :branch, `git rev-parse --abbrev-ref HEAD`.chomp

# Default deploy_to directory is /var/www/my_app_name
set :deploy_to, '/www/rails/ksot'

# Default value for :scm is :git
set :scm, :git

# Default value for :format is :pretty
# set :format, :pretty

# Default value for :log_level is :debug
# set :log_level, :debug

# Default value for :pty is false
# set :pty, true

# Default value for :linked_files is []
set :linked_files, fetch(:linked_files, []).push('config/database.yml', 'config/secrets.yml','config/unicorn.rb')

# Default value for linked_dirs is []
# set :linked_dirs, fetch(:linked_dirs, []).push('log', 'tmp/pids', 'tmp/cache', 'tmp/sockets', 'vendor/bundle', 'public/system')

# Default value for default_env is {}
# set :default_env, { path: "/opt/ruby/bin:$PATH" }

# Default value for keep_releases is 5
set :keep_releases, 10


after 'deploy:publishing', 'deploy:restart'
namespace :deploy do
  task :restart do
    set :unicorn_conf, "#{deploy_to}/current/config/unicorn.rb"
    set :unicorn_pid, "#{deploy_to}/shared/pids/unicorn.pid"
    on roles(:all), wait: 10 do
      execute :bash, "--login -c 'if [ -f /www/rails/wishes/shared/pids/unicorn.pid ] && [ -e /proc/$(cat /www/rails/wishes/shared/pids/unicorn.pid) ]; then kill -USR2 `cat /www/rails/wishes/shared/pids/unicorn.pid`; else cd /www/rails/wishes/current && bundle exec unicorn_rails -c /www/rails/wishes/current/config/unicorn.rb -E production -D; fi'"
    end
  end
end
namespace :deploy do

  after :restart, :clear_cache do
    on roles(:web), in: :groups, limit: 3, wait: 10 do
      # Here we can do anything such as:
      within release_path do
        execute :rake, 'cache:clear'
      end
    end
  end

end
