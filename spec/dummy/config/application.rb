require_relative "boot"

require "rails/all"

Bundler.require(*Rails.groups)
require "named_variant"

module Dummy
  class Application < Rails::Application
  end
end
