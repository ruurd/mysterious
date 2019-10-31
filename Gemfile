source 'https://rubygems.org'
ruby '2.6.3'

# General stuff
gem 'rails'
gem 'i18n'
gem 'haml'
gem 'thin'
gem 'pg'

# draper is a gem that adds decorators to models.
gem 'draper'

# config formerly rails_config is a gem that adds multi-level configuration to rails
gem 'config'

# Authentication...
gem 'devise'
gem 'devise-i18n'

# ... and authorization
gem 'cancancan'

# Views and widgets
gem 'uglifier'
gem 'coffee-rails'
gem 'jquery-rails'
gem 'turbolinks'
gem 'jbuilder'
gem 'less-rails'
gem 'railsstrap'
gem 'bootstrap_form'
gem 'kaminari-bootstrap'
gem 'therubyracer'

# Google search in abackground job
gem 'delayed_job_active_record'
gem 'delayed-web',  github: 'thebestday/delayed-web'
gem 'google-search'

# bullet is a development gem that helps you reduce queries
group :development do
  gem 'bullet'
  gem 'web-console', '~> 2.0'
end

group :development, :test do
  gem 'byebug'
  gem 'spring'
end

group :test do
  gem 'cucumber-rails', require: false
  gem 'rspec-rails'
  gem 'factory_girl_rails'
  gem 'minitest'
  gem 'database_cleaner'
  gem 'selenium-webdriver'
end

group :doc do
  gem 'sdoc'
end

