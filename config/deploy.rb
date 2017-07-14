# config valid only for current version of Capistrano
lock "3.7.2"
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

quit("项目名PROJECT_NAME必须填写在命令行中提供") unless ENV['PROJECT_NAME']
set :application, ENV['PROJECT_NAME']
set :default_env, {
  'PROJECT_NAME' => ENV['PROJECT_NAME']
}

set :repo_url, "git@gitlab.tanmer.com:tanmer/#{ENV['REPO'] || ENV['PROJECT_NAME']}.git"
ask :branch, `git rev-parse --abbrev-ref HEAD`.chomp
set :deploy_to, "/data/www/#{fetch(:application)}"

set :rvm_ruby_version, '2.3.3'

before "deploy", :check_branch do

  branch_prefix = "#{fetch(:application)}-"
  # quit("branch名称必须以#{branch_prefix}开头，否者不允许部署!") unless fetch(:branch).start_with?(branch_prefix)
  if fetch(:branch).start_with?(branch_prefix)
    set :branch, fetch(:branch)[branch_prefix.length..-1]
  end

  puts <<-MSG.green
real repo url is: #{fetch(:repo_url)}
  real branch is: #{fetch(:branch)}
       deploy to: #{fetch(:deploy_to)}
  MSG

  puts <<-MSG.yellow
如果要修改git仓库的名字，请在命令行中提供REPO，如：
REPO=dagle PROJECT_NAME=sxhop cap production deploy
  MSG

  ask(:is_start_to_deploy, 'start to deploy? (y/n, default=n)', 'n')

  quit("aborted") if fetch(:is_start_to_deploy).strip.downcase != 'y'
end


# Default value for :format is :airbrussh.
# set :format, :airbrussh

# You can configure the Airbrussh format using :format_options.
# These are the defaults.
# set :format_options, command_output: true, log_file: "log/capistrano.log", color: :auto, truncate: :auto

# Default value for :pty is false
# set :pty, true

# Default value for :linked_files is []
append :linked_files, "config/settings.#{ENV['PROJECT_NAME']}.yml", "config/app_settings.yml"

# Default value for linked_dirs is []
append :linked_dirs, "log", "tmp/pids", "tmp/cache", "tmp/sockets", "public/assets", "public/ckeditor_assets", 'node_modules', 'public/photos', 'public/attachments', 'public/templetes', 'public/system'

# Default value for default_env is {}
# set :default_env, { path: "/opt/ruby/bin:$PATH" }

# Default value for keep_releases is 5
# set :keep_releases, 5
