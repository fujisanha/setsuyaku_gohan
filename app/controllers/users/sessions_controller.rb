class Users::SessionsController < Devise::SessionsController
  def new_guest
    user = User.guest
    sign_in user
    redirect_to recipes_path, notice: 'Logged in as a guest user.'
  end
  protected

  def after_sign_in_path_for(resource)
    recipes_path
  end

  def after_sign_out_path_for(resource)
    flash[:notice] = "ログアウトしました"  # flashメッセージの追加もできます
    root_path
  end
end