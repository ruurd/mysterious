ENV['RAILS_ENV'] ||= 'test'
require File.expand_path('../../config/environment', __FILE__)
require 'factory_girl'
require 'rails/test_help'

class ActiveSupport::TestCase
  include FactoryGirl::Syntax::Methods
end

