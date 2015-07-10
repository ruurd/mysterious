require 'devise'
require 'factory_girl'
require 'support/controller_macros'

RSpec.configure do |config|
  # rspec-expectations config goes here.
  config.expect_with :rspec do |expectations|
    expectations.include_chain_clauses_in_custom_matcher_descriptions = true
  end

  # rspec-mocks config goes here.
  config.mock_with :rspec do |mocks|
    mocks.verify_partial_doubles = true
  end

  # factory girl here
  config.include FactoryGirl::Syntax::Methods

  # and devise after that because it uses factory girl factories
  config.include Devise::TestHelpers, :type => :controller
  config.extend ControllerMacros, :type => :controller
end
