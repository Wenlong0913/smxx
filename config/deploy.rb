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

quit("项目名PN必须填写在命令行中提供") unless ENV['PN']
set :application, ENV['PN']

set :repo_url, "git@gitlab.tanmer.com:tanmer/dagle.git"
ask :branch, `git rev-parse --abbrev-ref HEAD`.chomp
set :deploy_to, "/data/www/#{fetch(:application)}"

set :rvm_ruby_version, '2.3'

%w(deploy:check).each do |task|
  before task, :check_branch do
    branch_prefix = "#{fetch(:application)}-"
    quit("branch名称必须以#{branch_prefix}开头，否者不允许部署!") unless fetch(:branch).start_with?(branch_prefix)
  end
end

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
