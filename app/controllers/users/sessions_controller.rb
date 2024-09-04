class Users::SessionsController < Devise::SessionsController
  def new_guest
    user = User.guest
    sign_in user
    redirect_to about_path, notice: 'Logged in as a guest user.'
  end
end