require "selenium-webdriver"

Given /The application is running/ do
  @driver ||= Selenium::WebDriver.for(:phantomjs)
  @driver.navigate.to("http://localhost:3000/")
  visit '/'

  page.has_text? 'Welcome'
end

