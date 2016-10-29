# config valid only for current version of Capistrano
lock '3.4.0'

set :application, 'F7Demo' #项目名称
set :repo_url, 'git@gitlab.tanmer.com:tanmer/tmf.git' #git地址

# Default branch is :master
ask :branch, `git rev-parse --abbrev-ref HEAD`.chomp

# Default deploy_to directory is /var/www/my_app_name
set :deploy_to, '/data/www/tmf/F7Demo' #服务器端地址

# Default value for :linked_files is []
set :linked_files, fetch(:linked_files, []).push('config/database.yml', 'config/secrets.yml', 'config/settings.yml')

# Default value for linked_dirs is []
set :linked_dirs, fetch(:linked_dirs, []).push('log', 'tmp/pids', 'tmp/cache', 'tmp/sockets', 'vendor/bundle', 'public/system')

#指定ruby 版本
set :rvm_type, :system
set :rvm_ruby_version, 'ruby-2.2.1'

# namespace :bundler do
#   before :install, :delete_dot_ruby_gemset do
#     on roles(:all) do
#       within release_path do
#         execute :rm, '.ruby-gemset'
#         execute :rm, '.ruby-version'
#       end
#     end
#   end
# end

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