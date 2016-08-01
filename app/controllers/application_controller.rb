class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  private
def require_signin!
if current_customer.nil?
flash[:error] = "You need to sign in or sign up before continuing."
redirect_to signin_url
end
end
def current_customer
@current_customer ||= customer.find(session[:customer_id]) if session[:customer_id]
end
helper_method :current_customer	
private
def authorize_admin!
require_signin!
unless current_user.admin?
flash[:alert] = "You must be an admin to do that."
redirect_to root_path
end
end

end
