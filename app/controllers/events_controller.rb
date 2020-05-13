class EventsController < ApplicationController
  
  # View a list of events
  def index
     @events = Event.all
  end

  def show
      @event = Event.find(params[:id])
      if @event.admin_id == current_user.id
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

end
