class EventsController < ApplicationController
  before_action :set_beginning_of_week
  
  def new
  end
  
  private
  def set_beginning_of_week
    Date.beginning_of_week = :sunday
  end
end
