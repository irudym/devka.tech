class V1::QuestionsController < ApplicationController
  before_action :set_question, only: [:show, :update, :destroy, :restore]
  before_action :authenticate_user, only: [:create]

  def create
    new_params = question_params
    new_params[:user] = self.current_user
    @question = Question.create_with_tags!(new_params)
    render :show, status: 201
  end

  def index
    @questions = Question.all
  end

  def users
    user = User.find(params[:user_id])
    @questions = user.questions
    render :index, status: 200
  end

  def tags
    tag = Tag.where(text: params[:tag]).first
    @questions = tag.questions
    render :index, status: 200
  end

  private

  def question_params
    params.permit(:title, :description, :tags => [])
  end

  def set_question
    @question = Question.find(params[:id])
  end
end
