class V1::AvatarNosesController < ApplicationController
  before_action :set_avatar_nose, only: [:show, :update, :destroy, :restore]

  def index
    @avatar_noses = AvatarNose.all
  end

  def create
    @avatar_nose = AvatarNose.create!(avatar_nose_params)
    render :show, status: 201
  end

  def destroy
    @avatar_nose.destroy 
    json_response({}, 204)
  end

  private

  def set_avatar_nose
    @avatar_nose = AvatarNose.find(params[:id])
  end

  def avatar_nose_params
    # whitelist params
    params.permit(:picture)
  end
end
