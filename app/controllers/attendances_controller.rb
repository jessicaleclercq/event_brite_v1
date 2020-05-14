class AttendancesController < ApplicationController
  def new
    @event = Event.find(params[:id])
  end

  def create
    @attendance = Attendance.new(guest_id: params[:guest_id], event_id: params[:event_id], stripe_customer_id: params[:customer_id])
     if @attendance.save
       flash[:success] = "You are now attending this event !"
       redirect_to root_path
     else
       flash[:error] = "You failed"
       redirect_to root_path
     end
  end
  
end