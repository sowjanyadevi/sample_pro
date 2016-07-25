class UsersController < ApplicationController
	def index 
		@users=User.all
	end
	def new
        @user = User.new
    end
    def create
        @user = User.new(params[:id])
        if @user.save
        flash[:notice] = "You have signed up successfully."
        redirect_to users_path
        else
        render :new
    end
    end
private
def user_params
params.require(:user).permit(:name, :password, :password_confirmation)
end
end	
