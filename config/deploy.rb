# config valid only for current version of Capistrano
lock "3.7.1"
require 'colorize'

def quit(msg)
  puts ('*' * 50).yellow
  puts
  puts msg.red
  puts
  puts ('*' * 50).yellow
  puts
  exit(1)
end

set :application, "tmf"
set :repo_url, "git@gitlab.tanmer.com:tanmer/tmf.git"
set :rvm_ruby_version, '2.3'

before 'deploy:check', 'deploy:check:project_and_branch'
after 'deploy:assets:precompile', 'webpack:default'

# before 'deploy:check', :check_project_and_branch do
#   ask :project_name
#   # Default branch is :master
#   ask :branch, `git rev-parse --abbrev-ref HEAD`.chomp
#   quit("project_name 必须填写") if fetch(:project_name).to_s.strip.empty?
#   branch_prefix = "#{fetch(:project_name)}-"
#   quit("branch名称必须以#{branch_prefix}开头，否者不允许部署!") unless fetch(:branch).start_with?(branch_prefix)
#   set :deploy_to, "/data/www/#{fetch(:project_name)}"
# end
#
# after 'deploy:assets:precompile', :compile_webpack do
#   invoke 'webpack:install'
#   invoke 'webpack:precompile'
# end

# before 'deploy:check:directories', :check_project_and_branch

# Default deploy_to directory is /var/www/my_app_name


# Default value for :format is :airbrussh.
# set :format, :airbrussh

# You can configure the Airbrussh format using :format_options.
# These are the defaults.
# set :format_options, command_output: true, log_file: "log/capistrano.log", color: :auto, truncate: :auto

# Default value for :pty is false
# set :pty, true

# Default value for :linked_files is []
append :linked_files, "config/database.yml", "config/secrets.yml", "config/settings.yml"

# Default value for linked_dirs is []
append :linked_dirs, "log", "tmp/pids", "tmp/cache", "tmp/sockets", "public/assets", 'node_modules'

# Default value for default_env is {}
# set :default_env, { path: "/opt/ruby/bin:$PATH" }

# Default value for keep_releases is 5
# set :keep_releases, 5
