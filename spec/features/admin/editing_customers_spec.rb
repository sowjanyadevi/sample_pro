require 'spec_helper'
feature 'Editing a customer' do
let!(:admin_customer) { FactoryGirl.create(:admin_customer) }
let!(:customer) { FactoryGirl.create(:customer) }
before do
sign_in_as!(admin_customer)
visit '/'
click_link "Admin"
click_link "Customers"
click_link customer.email
click_link "Edit Customer"
end
before do
fill_in "Email", with: "newguy@example.com"
click_button "Update Customer"
expect(page).to have_content("customer has been updated.")
within("#customers") do
expect(page).to have_content("newguy@example.com")
expect(page).to_not have_content(customer.email)
end
end
before do
check "Is an admin?"
click_button "Update Customer"
expect(page).to have_content("Customer has been updated.")
within("#customers") do
expect(page).to have_content("#{customer.email} (Admin)")
end
end
end