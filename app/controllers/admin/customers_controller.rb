class Admin::CustomersController < ApplicationController
  def index
@customers = CUstomer.order(:email)
end
def new
@customer = Customer.new
end
def create
params = customer_params.dup
params[:password_confirmation] = params[:password]
@customer = customer.new(params)
if @customer.save
flash[:notice] = "Customer has been created."
redirect_to admin_customers_path
else
flash.now[:alert] = "Customer has not been created."
render :action => "new"
end
end
private
def customer_params
params.require(:customer).permit(:name,
:password,:password_confirmation)
end
end
