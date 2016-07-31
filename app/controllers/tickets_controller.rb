class TicketsController < ApplicationController
  # GET  tickets
  # GET  tickets.json
  before_action :set_project
  before_action :set_ticket, only: [:show, :edit, :update, :destroy]
before_action :require_signin!, except: [:show, :index]
  def index
     @tickets = Ticket.all
  end

  # GET  tickets/1
  # GET  tickets/1.json
  def show
     @ticket = Ticket.find(params[:id])
    @projects = Project.all
    @comment = @ticket.comments.build
    render "show"

  end

  # GET  tickets/new
  def new
    @project = Project.find(params[:project_id])
     @ticket = @project.tickets.build
  end

  # GET  tickets/1/edit
  def edit
 @ticket = Ticket.find(params[:id])
end

  # POST  tickets
  # POST  tickets.json
   def create
@ticket = @project.tickets.build(ticket_params)
@ticket.customer = current_customer
if @ticket.save
flash[:notice] = "Ticket has been created."
redirect_to [@project, @ticket]
else
flash[:alert] = "Ticket has not been created."
render "new"
end
end
    def update
if @ticket.update(ticket_params)
flash[:notice] = "Ticket has been updated."
redirect_to [@project, @ticket]
else
flash[:alert] = "Ticket has not been updated."
render action: "edit"
end
end
   def destroy
@ticket = Ticket.find(params[:id])
@ticket.destroy
flash[:notice] = "ticket has been destroyed."
redirect_to project_tickets_path
end
  
    private
    
    def ticket_params
      params.require(:ticket).permit(:title, :description)
    end
    def set_ticket
     @project = Project.find(params[:project_id])
      @ticket = @project.tickets.where(:id => params[:id])
end

    def set_project
      @project = Project.find(params[:project_id])
    end
    end
