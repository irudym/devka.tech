class V1::AvatarBodiesController < ApplicationController
  before_action :set_avatar_body, only: [:show, :update, :destroy, :restore]
  
  def index
    @avatar_bodies = AvatarBody.all
  end

  def create
    @avatar_body = AvatarBody.create!(avatar_body_params)
    render :show, status: 201
  end

  def destroy
    @avatar_body.destroy 
    json_response({}, 204)
  end

  private

  def set_avatar_body
    @avatar_body = AvatarBody.find(params[:id])
  end

  def avatar_body_params
    # whitelist params
    params.permit(:picture)
  end

end
