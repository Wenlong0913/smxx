namespace :webpack do

  desc "Install npm packages for webpack"
  task :install do
    on roles(:assets) do |h|
      execute "npm install"
    end
  end

  desc "Compile assets for webpack"
  task :precompile do
    on roles(:assets) do |h|
      execute "rails webpack:compile"
    end
  end
end
