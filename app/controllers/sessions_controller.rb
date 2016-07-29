class SessionsController < ApplicationController
	def create
customer = Customer.where(:name => params[:signin][:name]).first
if customer && customer.authenticate(params[:signin][:password])
session[:customer_id] = customer.id
flash[:notice] = "Signed in successfully."
redirect_to root_url
else
flash[:error] = "Sorry."
render :new
end
end
end