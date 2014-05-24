require File.expand_path('../boot', __FILE__)

require 'rails/all'

Bundler.require(*Rails.groups)

module PunditSample
  class Application < Rails::Application
    config.time_zone = 'Tokyo'
    config.active_record.default_timezone = :local

    config.generators.template_engine = :slim
    config.generators.test_framework  = :rspec

    # config.i18n.load_path += Dir[Rails.root.join('config', 'locales', '**', '*.{rb,yml}').to_s]
    # I18n.enforce_available_locales = true
    # config.i18n.default_locale = :ja

    config.autoload_paths += %W(#{config.root}/lib)
    config.autoload_paths += Dir["#{config.root}/lib/**/"]
    config.autoload_paths += Dir["#{config.root}/app/validators"]
  end
end
