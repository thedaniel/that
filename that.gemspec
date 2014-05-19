$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "that/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "that"
  s.version     = That::VERSION
  s.authors     = ["Daniel Hengeveld"]
  s.email       = ["danielwh@gmail.com"]
  s.homepage    = "https://github.com/thedaniel/that"
  s.summary     = "ActiveRecord console findey-helpey guy"
  s.description = <<-EOS
  Adds a global method `that`, used to search across relevant fields for all
  available ActiveRecord models for matches for a string. Like running
  {Post,User,Comment}.find_by_{name,login,email}("foo")
  EOS

  s.files = Dir["{app,config,db,lib}/**/*", "MIT-LICENSE", "Rakefile", "README.rdoc"]
  s.test_files = Dir["test/**/*"]

  s.add_dependency "rails"
end
