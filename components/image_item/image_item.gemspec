$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "image_item/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "image_item"
  s.version     = ImageItem::VERSION
  s.authors     = ["linan"]
  s.email       = ["linan.avvo@gmail.com"]
  s.homepage    = "http://tanmer.com"
  s.summary     = "Summary of ImageItem."
  s.description = "Description of ImageItem."
  s.license     = "MIT"

  s.files = Dir["{app,config,db,lib}/**/*", "MIT-LICENSE", "Rakefile", "README.md"]
  s.test_files = Dir["spec/**/*"]

  s.add_dependency "rails", "~> 5.0.0", ">= 5.0.0.1"
  s.add_dependency 'cells', '~> 4.1.4'
  s.add_dependency "cells-rails", '~> 0.0.6'
  s.add_dependency "cells-slim", '~> 0.0.5'
  s.add_development_dependency "pg"
end
