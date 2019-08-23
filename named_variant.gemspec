$LOAD_PATH.push File.expand_path("lib", __dir__)

# Maintain your gem's version:
require "named_variant/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |spec|
  spec.name        = "named_variant"
  spec.version     = NamedVariant::VERSION
  spec.authors     = ["Yukito Ito"]
  spec.email       = ["yukibukiyou@gmail.com"]
  spec.homepage    = "https://github.com/ykpythemind/named_variant"
  spec.summary     = "Named ActiveStorage's variant"
  spec.description = "Make ActiveStorage's variant named and configurable"
  spec.license     = "MIT"

  spec.files = Dir["{lib}/**/*", "MIT-LICENSE", "Rakefile", "README.md"]

  spec.add_dependency "activestorage"
  spec.add_dependency "activesupport"

  spec.add_development_dependency "mini_magick"
  spec.add_development_dependency "onkcop", "~> 0.53"
  spec.add_development_dependency "rails", "~> 5.2"
  spec.add_development_dependency "rspec-rails"
  spec.add_development_dependency "sqlite3"
end
