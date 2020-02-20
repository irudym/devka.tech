class V1::AvatarEyesController < ApplicationController
  before_action :set_avatar_eye, only: [:show, :update, :destroy, :restore]
  
  def index
    @avatar_eyes = AvatarEye.all
  end

  def create
    @avatar_eye = AvatarEye.create!(avatar_eye_params)
    render :show, status: 201
  end

  def destroy
    @avatar_eye.destroy 
    json_response({}, 204)
  end

  private

  def set_avatar_eye
    @avatar_eye = AvatarEye.find(params[:id])
  end

  def avatar_eye_params
    # whitelist params
    params.permit(:picture)
  end

end
