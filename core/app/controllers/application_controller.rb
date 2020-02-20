class ApplicationController < ActionController::API
  include ExceptionHandler
  include Response

  # called before every action on controllers
  # before_action :authorize_request, only: [:authenticate_admin, :authenticate_user]
  attr_reader :current_user

  def authenticate_admin
    authorize_request
    unless @current_user.is_admin?
      raise(ExceptionHandler::AuthenticationError, Message.invalid_credentials)
    end
  end

  def authenticate_user
    authorize_request
    puts "Current user: #{@current_user}"
    unless @current_user
      raise(ExceptionHandler::AuthenticationError, Message.need_to_login)
    end
  end

  private

  # check for valid request token and return user
  def authorize_request
    puts "Authorize request"
    @current_user = nil
    @current_user = (AuthorizeApiRequest.new(request.headers).call)[:user]
  end

end
