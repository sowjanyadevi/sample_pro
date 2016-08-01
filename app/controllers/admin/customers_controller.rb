class Admin::CustomersController < ApplicationController
	before_action :set_customer, only: [:show, :edit, :update, :destroy]
  def index
@customers = CUstomer.order(:email)
end
def new
@customer = Customer.new
end
def show
end
def edit
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
def update
	if params[:customer][:password].blank?
params[:customer].delete(:password)
params[:customer].delete(:password_confirmation)
end
if @customer.update(customer_params)
flash[:notice] = "Customer has been updated."
redirect_to admin_customers_path
else
flash[:alert] = "Customer has not been updated."
render action: "edit"
end
end
def destroy
@customer.destroy
flash[:notice] = "customer has been deleted."
redirect_to admin_customers_path
end
private
def customer_params
params.require(:customer).permit(:name,
:password,:password_confirmation,:admin)
end
def set_customer
@customer = Customer.find(params[:id])
end
end
