require 'spec_helper'
feature 'Signing up' do
before do
visit '/'
click_link 'Sign up'
fill_in "Email", with: "customer@example.com"
fill_in "Password", with: "password"
fill_in "Password confirmation", with: "password"
end
end

