require 'spec_helper'
feature 'Deleting customers' do
let!(:admin_customer) { FactoryGirl.create(:admin_customer) }
let!(:customer) { FactoryGirl.create(:customer) }
before do
sign_in_as!(admin_customer)
visit '/'
click_link 'Admin'
click_link 'Customers'
end
before do
click_link customer.email
click_link "Delete Customer"
expect(page).to have_content("Customer has been deleted")
end
end