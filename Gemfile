source 'https://rubygems.org'

gem 'rails', '3.2.12'

gem 'jquery-rails'
gem 'money-rails'
gem 'sqlite3'

group :assets do
  gem 'sass-rails',   '~> 3.2.3'
  gem 'coffee-rails', '~> 3.2.1'

  # See https://github.com/sstephenson/execjs#readme for more supported runtimes
  # gem 'therubyracer', :platforms => :ruby

  gem 'uglifier', '>= 1.0.3'
end

group :development do
  gem 'quiet_assets'
  gem 'better_errors'
  gem 'binding_of_caller' # better_errors likes this
  gem 'factory_girl_rails', require: false

  if ENV['RM_INFO'] # Don't load the debugger when running under Rubymine
    gem 'debugger', require: false
  else
    gem 'debugger'
  end
end

group :test do
  gem 'capybara'
  gem 'cucumber-rails', require: false
  gem 'database_cleaner'
  gem 'factory_girl_rails'
  gem 'rspec-instafail'
  gem 'rspec-rails'
  gem 'shoulda-matchers'
end
