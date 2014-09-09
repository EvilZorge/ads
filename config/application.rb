require File.expand_path('../boot', __FILE__)

require 'rails/all'

Bundler.require(*Rails.groups)

module Ads
  class Application < Rails::Application
    config.autoload_paths << Rails.root.join('lib')
    config.generators do |generate|
      generate.helper false
      generate.assets false
    end
  end
end
