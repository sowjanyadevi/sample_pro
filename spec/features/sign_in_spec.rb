require 'spec_helper'
feature "signing in." do
before do
customer	 = FactoryGirl.create(:customer)
visit '/'
click_link 'Sign in'
fill_in 'Name', with: customer.name
fill_in 'Password', with: customer.password
end
end
