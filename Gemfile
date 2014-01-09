source 'https://rubygems.org'

# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '4.0.0'
gem 'bootstrap-sass'
gem 'simple_form'
gem 'haml-rails'
gem 'devise'
gem 'devise_invitable'
gem 'geocoder'
gem 'bootstrap-datepicker-rails'
gem 'prawn'
gem 'prawn-rails', '~> 0.0.2'
gem "redcarpet"
gem 'pagedown-bootstrap-rails'
gem 'select2-rails'
gem 'carrierwave'
gem 'kaminari'
gem 'kaminari-bootstrap'
gem "rmagick"
gem "nested_form"
gem 'friendly_id', '~> 5.0.0'
gem 'rubocop', '~> 0.15.0'
gem 'therubyracer'
gem 'paper_trail', '>= 3.0.0.rc2'
gem 'sunspot_rails'
gem 'remotipart', '~> 1.2'

# Use PostgreSql as the database for Active Record
gem 'pg'

# Use SCSS for stylesheets
gem 'sass-rails', '~> 4.0.0'

# Use Uglifier as compressor for JavaScript assets
gem 'uglifier', '>= 1.3.0'

# Use CoffeeScript for .js.coffee assets and views
gem 'coffee-rails', '~> 4.0.0'

# See https://github.com/sstephenson/execjs#readme for more supported runtimes
# gem 'therubyracer', platforms: :ruby

# Use jquery as the JavaScript library
gem 'jquery-rails'


# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder', '~> 1.2'

group :doc do
  # bundle exec rake doc:rails generates the API under doc/api.
  gem 'sdoc', require: false
end

# Use ActiveModel has_secure_password
# gem 'bcrypt-ruby', '~> 3.0.0'

# Use unicorn as the app server
gem 'unicorn'

# Use Capistrano for deployment
gem "capistrano", '2.15.5'

# For background seed of database 
gem 'delayed_job_active_record'

# Use debugger
# gem 'debugger', group: [:development, :test]

group :development do
  gem 'annotate'
  gem "better_errors"
  gem "binding_of_caller"
end
group :test, :development do
  gem 'rspec-rails', '~> 2.0'
  gem 'guard-rspec', '2.5.0'
  gem 'spork-rails', '4.0.0'
  gem 'guard-spork', '1.5.0'
  gem 'childprocess', '0.3.6'
  gem 'pry-rails'
  gem 'faker', '~> 1.2.0'
  gem 'sunspot_solr'
  gem 'sunspot_matchers'
end

group :test do
	gem 'selenium-webdriver', '~> 2.39.0'
  gem 'capybara', '2.1.0'
  gem 'factory_girl_rails', '4.2.1'
  gem 'shoulda-matchers'
  gem 'email_spec'
  gem 'simplecov', require: false
end
