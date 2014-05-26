ENV["RAILS_ENV"] ||= 'test'

require 'coveralls'
Coveralls.wear!('rails')

require File.expand_path("../../config/environment", __FILE__)
require 'rspec/rails'
require 'pundit/rspec'
require 'factory_girl_rails'

Dir[Rails.root.join("spec/support/**/*.rb")].each { |f| require f }

ActiveRecord::Migration.check_pending! if defined?(ActiveRecord::Migration)

RSpec.configure do |config|
  config.include FactoryGirl::Syntax::Methods
  config.fixture_path = "#{::Rails.root}/spec/fixtures"
  config.use_transactional_fixtures = true
  config.infer_base_class_for_anonymous_controllers = false
  config.order = "random"

  config.before :suite do
    DatabaseRewinder.clean_all
  end

  config.after :each do
    DatabaseRewinder.clean
  end

  config.include Devise::TestHelpers, type: :controller
end

FG = FactoryGirl
