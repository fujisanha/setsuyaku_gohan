class Admin::UsersController < ApplicationController
  layout 'admin'
  before_action :authenticate_admin!
  
  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
  end
  
  def destroy
    user = User.find(params[:id])
    user.destroy
    flash[:notice] = "deleted"
    redirect_to admin_root_path
  end
end
