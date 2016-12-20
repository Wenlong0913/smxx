desc "Compile assets for webpack"
task :webpack do
  on roles(:assets) do |h|
    execute "rails webpack:compile"
  end
end
