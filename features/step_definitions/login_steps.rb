require "selenium-webdriver"

Given /The application is running/ do
  @driver = Selenium::WebDriver.for(:phantomjs)
  visit(root_path)
  response.body.should =~ /Welcome/m
end

And /Nobody is logged in/ do
  response.body.should =~ /User/m
end

When /I request the login page/ do
  visit(new_user_session_path)
  response.body.should =~ /Log in/m
end

And (/^I request to be logged out$/) do
  visit(destroy_user_session_path)
end

And /I enter valid credentials/ do
  fill_in( "User Name", :with => user_name )
  fill_in( "Password", :with => 'xyzzyuiop' )
  click_button( "Log in" )
end

Then /I am logged in/ do
  response.body.should =~ /tiscali/m
end

Then /I am logged out/ do
  response.body.should =~ /User/m
end

