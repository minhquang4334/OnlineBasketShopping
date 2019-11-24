
module Api
  class AuthenticationController < ApplicationController
    before_action :authorize_request, except: :login

    # POST /auth/login
    def login
      user = User.find_by_email(params[:email])
      password = params[:password]
      if user && user&.authenticate(password)
        token = JsonWebToken.encode(user_id: user.id)
        time = Time.now + 24.hours.to_i
        render json: { token: token, exp: time.strftime("%m-%d-%Y %H:%M"),
                       email: user.email }, status: :ok
      else
        render json: { error: 'unauthorized' }, status: :unauthorized
      end
    end

    def check
      render json: {
          current_user: current_user
      }
    end

    private

    def login_params
      params.permit(:email, :password)
    end

  end
end