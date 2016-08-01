require 'spec_helper'
feature "Creating Customers" do
let!(:admin) { FactoryGirl.create(:admin_customer) }
before do
sign_in_as!(admin)
visit '/'
click_link "Admin"
click_link "Customers"
click_link "New Customer"
end
before do
fill_in "Email", with: "newbie@example.com"
fill_in "Password", with: "password"
click_button "Create customer"
expect(page).to have_content("Customer has been created.")
end
end