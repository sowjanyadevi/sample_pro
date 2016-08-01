require 'spec_helper'
feature 'Editing a customer' do
it "requires an email" do
c = Customer.new(name: "steve",
password: "hunter2",
password_confirmation: "hunter2")
c.save
expect(c).to_not be_valid
c.email = "steve@example.com"
c.save
expect(c).to be_valid
end
end