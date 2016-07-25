class UsersController < ApplicationController
	def index 
		@users=User.all
	end
	def new
        @user = User.new
    end
    def create
        @user = User.new(user_params)
        if @user.save
        flash[:notice] = "You have signed up successfully."
        redirect_to projects_path
        else
        render :new
    end
end

     def show
    @user = User.find(params[:id])
  end
  
  	 def update
   @user = User.find(user_params)
   @user.update(user_params)
   flash[:notice] = "user has been updated."
   redirect_to @projects_path
   end

private
def user_params
params.require(:user).permit(:name, :password, :password_confirmation)
end
end	
