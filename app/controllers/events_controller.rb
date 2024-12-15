class EventsController < ApplicationController
  before_action :set_beginning_of_week
  
  def new
    @events = Event.all
    @event = Event.new
    @total_income = @events.sum(:income)
    @total_expense = @events.sum(:expense)
    @submit_label = "記録する"
  end
  
  def create
    @event = current_user.events.build(event_params)
    if @event.save
      flash[:notice] = "recorded"
      redirect_to new_event_path
    else
      render :new
    end
  end
  
  def edit
    @event = Event.find(params[:id])
    @submit_label = "更新する"
  end
  
  def update
    @event = Event.find(params[:id])
    if @event.update(event_params)
      flash[:notice] = "updated"
      redirect_to new_event_path
    else
      render :new
    end
  end
  
  def destroy
    @event = Event.find(params[:id])
    if @event.destroy
      flash[:notice] = "deleted"
      redirect_to new_event_path
    else
      render :new
    end
  end
  
  private
  def set_beginning_of_week
    Date.beginning_of_week = :sunday
  end
  
  def event_params
    params.require(:event).permit(:income, :expense, :start_time)
  end
end
