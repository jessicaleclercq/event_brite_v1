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

end
