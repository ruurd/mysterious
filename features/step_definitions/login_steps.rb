And /Nobody is logged in/ do
  page.text.include? 'User'
end

And /I request the login page/ do
  visit new_user_session_path
  puts page.pretty_inspect
  page.has_text? 'Log in'
end

And (/^I request to be logged out$/) do
  visit destroy_user_session_path
end

And /I enter valid credentials/ do
  page.fill_in('user_email', with: 'rfpels@gmail.com' )
  page.fill_in('user_password', with: 'xyzzyuiop' )
  page.click_button('Log in')
end

Then /I am logged in/ do
  page.has_text? 'tiscali'
end

Then /I am logged out/ do
  page.has_text? 'User'
end

