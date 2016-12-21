namespace :deploy do
  namespace :check do
    task :project_and_branch do
      ask :project_name, ENV['PN']
      # Default branch is :master
      ask :branch, `git rev-parse --abbrev-ref HEAD`.chomp
      quit("project_name 必须填写") if fetch(:project_name).to_s.strip.empty?
      branch_prefix = "#{fetch(:project_name)}-"
      quit("branch名称必须以#{branch_prefix}开头，否者不允许部署!") unless fetch(:branch).start_with?(branch_prefix)
      set :deploy_to, "/data/www/#{fetch(:project_name)}"
    end
  end
end
