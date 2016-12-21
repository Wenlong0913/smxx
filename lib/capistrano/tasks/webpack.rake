namespace :webpack do

  task :default => ['install', 'precompile'] do
  end

  desc "Install npm packages for webpack"
  task :install => 'deploy:check:project_and_branch' do
    on roles(:assets) do |h|
      within release_path do
        execute :npm, :install
      end
    end
  end

  desc "Compile assets for webpack"
  task :precompile => ['deploy:check:project_and_branch'] do
    on roles(:assets) do |h|
      within release_path do
        with rails_env: fetch(:stage) do
          execute :bundle, :exec, 'rails webpack:compile'
        end
      end
    end
  end
end
