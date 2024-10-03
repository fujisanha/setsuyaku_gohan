class Admin::CommentsController < ApplicationController
  layout 'admin'
  before_action :authenticate_admin!
  
  def index
  end
  
  def destroy
  end
end
