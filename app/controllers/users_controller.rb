class UsersController < ApplicationController
  before_action :authenticate_user!
  
  def index
    @users = User.all.order(created_at: :desc)
  end
  
  def show
  end
  
  def edit
    @user = current_user
  end
  
  def update
    @user = current_user
    if @user.update(user_params)
      flash[:notice] = "updated"
      redirect_to user_path(current_user)
    else
      render :edit
    end
  end
  
  private
  def user_params
    params.require(:user).permit(:name, :email, :introduction, :image)
  end
end
