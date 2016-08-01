class ProjectsController < ApplicationController
  before_action :authorize_admin!, except: [:index, :show]
before_action :set_project, only: [:show, :edit, :update, :destroy]
  def index
    @projects = Project.all
  end

  # GET /projects/1
  # GET /projects/1.json
  def show
    @project = Project.find(params[:id])
  end

  # GET /projects/new
  def new
    @ticket=Project.new
  end

  # GET /projects/1/edit
  def edit
@project = Project.find(params[:id])
end

 def authorize_admin!
require_signin!
unless current_customer.admin?
flash[:alert] = "You must be an admin to do that."
redirect_to root_path
end
endn
 
   def create
        @project = Project.new(project_params)

        if @project.save
            redirect_to projects_path,  :notice => "Project has been created."
        else
            render "new"
        end
    end
    def update
   @project = Project.find(params[:id])
   @project.update(project_params)
   flash[:notice] = "Project has been updated."
   redirect_to @project
   end
   def destroy
@project = Project.find(params[:id])
@project.destroy
flash[:notice] = "Project has been destroyed."
redirect_to projects_path
end
  
    private
    
    def project_params
      params.require(:project).permit(:name, :description)
    end
end
