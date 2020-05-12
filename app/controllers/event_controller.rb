class EventController < ApplicationController
  
  # View a list of events
  def index
     @events = Event.all
  end

  def show
      @event = Event.find(params[:id])
  end  

  #def new
    #@event = Event.new
  #end

end
