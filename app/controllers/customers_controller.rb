class CustomersController < ApplicationController
  def new
@customer = Customer.new
end
  def create
@customer = Customer.new(customer_params)
if @customer.save
flash[:notice] = "You have signed up successfully."
redirect_to projects_path
else
render :new
end
end

  def show
  end
  private
def customer_params
params.require(:customer).permit(:name,:password,
:password_confirmation)
end
end
