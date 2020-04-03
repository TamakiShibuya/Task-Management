class SessionsController < ApplicationController
  skip_before_action :login_reqired
  def new
  end

  def create
    user= User.find_by(email: session_params[:email])

    if users&.authenticate(session_params[:password])
      session[:user_id] = user.user_id
      redirectt_to root_url, notice: 'ログインしました'
    else
      render :new
    end
  end

  def destoroy
    reset_session
    redirect_to root_url, notice: 'ログアウトしました'
  end

  private

  def sessiion_params
    params.require(:session).permit(:email, :password)
  end
end
