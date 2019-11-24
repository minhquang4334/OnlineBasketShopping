class ApplicationController < ActionController::Base
  add_flash_types :success, :danger, :warning
  protect_from_forgery with: :null_session
  def not_found
    render json: { error: 'not_found' }
  end

  def authorize_request
    header = request.headers['Authorization']
    header = header.split(' ').last if header
    begin
      @decoded = JsonWebToken.decode(header)
      @current_user = User.find(@decoded[:user_id])
    rescue ActiveRecord::RecordNotFound => e
      render json: { errors: e.message }, status: :unauthorized
    rescue JWT::DecodeError => e
      render json: { errors: e.message }, status: :unauthorized
    end
  end

  helper_method :current_user

  def current_user
    if session[:user_id].nil?
      return false
    end
    User.find(session[:user_id])
  end
end
