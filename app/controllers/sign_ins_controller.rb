class SignInsController < ApplicationController
  def create
    user = User.find_by(email: params[:sign_in_user_params][:email])
    if user.blank?
      raise ActiveRecord::RecordNotFound and return
    end
    if user.authenticate(params[:sign_in_user_params][:password])
      serialize = MeSerializer.new(user)
      render json: serialize.as_json
    else
      raise ActionController::BadRequest
    end
  end
  def sign_in_user_params
    params.require(:sign_in_user_params).permit(
      :email,
      :password,
      :password_confirmation
    )
  end
end
