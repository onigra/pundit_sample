source 'https://rubygems.org'
ruby "2.1.2"

# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails'

# Use mysql as the database for Active Record
gem 'mysql2'

# Use SCSS for stylesheets
gem 'sass-rails', '~> 4.0.2'

# Use Uglifier as compressor for JavaScript assets
gem 'uglifier', '>= 1.3.0'

# Use CoffeeScript for .js.coffee assets and views
gem 'coffee-rails', '~> 4.0.0'

# See https://github.com/sstephenson/execjs#readme for more supported runtimes
# gem 'therubyracer', platforms: :ruby

# Use jquery as the JavaScript library
gem 'jquery-rails'

# Turbolinks makes following links in your web application faster. Read more: https://github.com/rails/turbolinks
gem 'turbolinks'

# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder', '~> 1.2'

group :doc do
  # bundle exec rake doc:rails generates the API under doc/api.
  gem 'sdoc', require: false
end

gem 'devise'
gem 'pundit'
gem 'seed-fu', github: 'mbleigh/seed-fu'
gem 'slim-rails'
gem 'devise-better_routes'

group :test, :development do
  gem 'rspec-rails'
  gem 'minitest'
  gem 'shoulda-matchers', '2.5'
  gem 'rake_shared_context'
  gem 'accept_values_for'

  gem 'database_rewinder'
  gem 'factory_girl_rails'
  gem 'forgery'

  gem 'spring-commands-rspec'
  gem 'guard-rspec'
  gem 'guard-livereload'
  gem 'growl'

  gem 'byebug'
  gem 'awesome_print'
  gem 'pry-rails'
  gem 'pry-coolline'
  gem 'pry-doc'
  gem 'pry-byebug'
  gem 'pry-stack_explorer'
  gem 'pry-remote'
  gem 'tapp'

  gem 'better_errors'
  gem 'binding_of_caller'
  gem "annotate", github: "ctran/annotate_models"
  gem 'bullet'
end

gem 'rails_12factor', group: :production

group :test do
  gem 'coveralls', :require => false
end

# Use ActiveModel has_secure_password
# gem 'bcrypt', '~> 3.1.7'

# Use unicorn as the app server
gem 'unicorn'

# Use Capistrano for deployment
# gem 'capistrano', group: :development

# Use debugger
# gem 'debugger', group: [:development, :test]
