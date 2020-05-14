class EventsController < ApplicationController
  before_action :authenticate_user!, only: [:show, :edit]

  # View a list of events
  def index
     @events = Event.all
  end

  def show
      @event = Event.find(params[:id])
      if @event.admin_id == current_user
        @admin = current_user
      end
  end

  def new
    @event = Event.new
  end

  def create
    @event = Event.new(title: params[:title], duration: params[:duration], description: params[:description], price: params[:price],start_date: params[:start_date], location: params[:location], admin_id: current_user.id)
    if @event.save
      redirect_to root_path
    else
      flash[:danger] = "You must fill all the fields !"
      redirect_to new_event_path
    end
  end  

  def edit
    @event = Event.find(params[:id])
  end
  
def update
    @event = Event.find(params[:id])
    if @event.update(title: params[:title], duration: params[:duration], description: params[:description], price: params[:price],start_date: params[:start_date], location: params[:location], admin_id: current_user.id)
      redirect_to root_path
      flash[:success] = "The event was modified"
    else
      render :edit
      flash[:error] = "Please retry your modification"
    end
end

  def destroy
    Event.find(params[:id]).delete
    redirect_to root_path
  end

private

  def event_params
    params.require(:events).permit(:title, :location, :duration, :description, :price, :start_date, :admin_id)
  end
  
end

