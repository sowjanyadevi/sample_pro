require 'spec_helper'
describe Admin::CustomersController do
let(:customer) { FactoryGirl.create(:customer) }
context "standard customers" do
before  do
	 sign_in(customer)
get 'index'
expect(response).to redirect_to('/')
expect(flash[:alert]).to eql("You must be an admin to do that.")
end
end
end