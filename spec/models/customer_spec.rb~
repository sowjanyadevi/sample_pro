require 'spec_helper'
describe Customer do
describe "passwords" do
it "needs a password and confirmation to save" do
c = Customer.new(name: "steve")
c.save
expect(c).to_not be_valid
c.password = "password"
c.password_confirmation = ""
c.save
expect(c).to_not be_valid
c.password_confirmation = "password"
c.save
expect(c).to be_valid
end
it "needs password and confirmation to match" do
c = Customer.create(
name: "steve",
password: "hunter2",
password_confirmation: "hunter")
expect(c).to_not be_valid
end
end
describe "authentication" do
let(:customer) { Customer.create(
name: "steve",
password: "hunter2",
password_confirmation: "hunter2") }
it "authenticates with a correct password" do
expect(customer.authenticate("hunter2")).to be
end
it "does not authenticate with an incorrect password" do
expect(customer.authenticate("hunter1")).to_not be
end
end
end
