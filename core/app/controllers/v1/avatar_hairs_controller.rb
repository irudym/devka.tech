class V1::AvatarHairsController < ApplicationController
  before_action :set_avatar_hair, only: [:show, :update, :destroy, :restore]

  def index
    @avatar_hairs = AvatarHair.all
  end

  def create
    @avatar_hair = AvatarHair.create!(avatar_hair_params)
    render :show, status: 201
  end

  def destroy
    @avatar_hair.destroy 
    json_response({}, 204)
  end

  private

  def set_avatar_hair
    @avatar_hair = AvatarHair.find(params[:id])
  end

  def avatar_hair_params
    # whitelist params
    params.permit(:picture)
  end 

end
