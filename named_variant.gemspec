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
  spec.summary     = "Make ActiveStorage's variant named and configurable"
  spec.description = ""
  spec.license     = "MIT"

  # Prevent pushing this gem to RubyGems.org. To allow pushes either set the 'allowed_push_host'
  # to allow pushing to a single host or delete this section to allow pushing to any host.
  if spec.respond_to?(:metadata)
    spec.metadata["allowed_push_host"] = "TODO: Set to 'http://mygemserver.com'"
  else
    raise "RubyGems 2.0 or newer is required to protect against " \
      "public gem pushes."
  end

  spec.files = Dir["{app,config,db,lib}/**/*", "MIT-LICENSE", "Rakefile", "README.md"]

  spec.add_dependency "rails", "~> 5.0"

  spec.add_development_dependency "onkcop", "~> 0.53"
  spec.add_development_dependency "rspec-rails"
  spec.add_development_dependency "sqlite3"
end
