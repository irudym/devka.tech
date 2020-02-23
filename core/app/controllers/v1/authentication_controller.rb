class V1::AuthenticationController < ApplicationController
  # skip_before_action :authenticate_user, only: :authenticate

  # return auth token once user is authenticated
  def authenticate
    # sleep 5
    auth_token = AuthenticateUser.new(auth_params[:email], auth_params[:password]).call
    user = User.find_by(email:auth_params[:email])
    puts "USER: #{user.id}"
    json_response({ auth_token: auth_token, nickname: user.nickname, id: user.id })
  end

  private

  def auth_params
    params.permit(:email, :password)
  end
end