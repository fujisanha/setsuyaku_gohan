class Users::RegistrationsController < Devise::RegistrationsController
  before_action :check_guest, only: %i[update destroy]

  protected

  #アップデート時にパスワード確認を必要とさせない
  def update_resource(resource, params)
    resource.update_without_current_password(params)
  end
end