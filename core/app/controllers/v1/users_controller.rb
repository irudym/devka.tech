class V1::UsersController < ApplicationController
  # skip_before_action :authorize_request, only: :create
  def create
    user = User.create!(user_params)

    auth_token = AuthenticateUser.new(user.email, user.password).call
    response = { message: Message.account_created, auth_token: auth_token, nickname: user_params[:nickname] }
    json_response(response, :created)
  end

  private

  def user_params
    params.permit(:first_name, :last_name, :nickname, :email, :password, :password_confirmation)
  end 
end
