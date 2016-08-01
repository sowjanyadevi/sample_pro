require 'spec_helper'
feature 'Creating Projects' do
before do
sign_in_as!(FactoryGirl.create(:admin_customer))
visit '/'
click_link 'New Project'
fill_in 'Name', with: 'TextMate 2'
fill_in 'Description', with: 'A text-editor for OS X'
end
end

