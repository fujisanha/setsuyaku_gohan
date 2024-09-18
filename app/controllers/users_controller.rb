class UsersController < ApplicationController
  def index
    @users = User.all.order(created_at: :desc)
  end
  
  def edit
    
  end
  
  def update
    
  end
end
