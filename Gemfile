source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '2.5.0'

# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '~> 5.2.0'
# PostgreSQL DB
gem 'pg'
# Use Puma as the app server
gem 'puma', '~> 3.11'
# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
# gem 'jbuilder', '~> 2.5'
# Use Redis adapter to run Action Cable in production
# gem 'redis', '~> 4.0'
# Use ActiveModel has_secure_password
# gem 'bcrypt', '~> 3.1.7'


# Reduces boot times through caching; required in config/boot.rb
gem 'bootsnap', '>= 1.1.0', require: false

# Use Rack CORS for handling Cross-Origin Resource Sharing (CORS), making cross-origin AJAX possible
# gem 'rack-cors'

# Money gem integration with Rails (https://github.com/RubyMoney/money-rails)
gem 'money-rails', '~>1.12'
# Object factory for Rails (https://github.com/thoughtbot/factory_bot_rails)
gem 'factory_bot_rails'
# A library for generating fake data (https://github.com/stympy/faker)
gem 'faker', '~>1.9'
# Ruby implementation of GraphQL (https://github.com/rmosolgo/graphql-ruby)
gem 'graphql', '~>1.8'
# Mount the GraphiQL query editor in a Rails app (https://github.com/rmosolgo/graphiql-rails)
gem 'graphiql-rails', '~> 1.4', '>= 1.4.2'


group :development, :test do
  # Call 'byebug' anywhere in the code to stop execution and get a debugger console
  gem 'byebug', platforms: [:mri, :mingw, :x64_mingw]
  # A runtime developer console with powerful introspection capabilities (https://github.com/pry/pry)
  gem 'pry'
  # RSpec for Rails-3+ (https://github.com/rspec/rspec-rails)
  gem 'rspec-rails', '~> 3.6.0'
end

group :development do
  gem 'listen', '>= 3.0.5', '< 3.2'
  # Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
end


# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]
