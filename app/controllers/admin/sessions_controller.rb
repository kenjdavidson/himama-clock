# Manages User sessions (login, logout)
#
# Login/Logout use the Session which is then available within the ActiveSessionConcern
# for other controllers.
#
class Admin::SessionsController < ApplicationController
  def login
    @login_request = LoginRequest.new
  end

  def create
    user = User.find_by(email: params[:email])

    if user&.authenticate(params[:password])
      logged_in user
      redirect_to admin_users_path
    else
      flash[:login_error] = 'Invalid email and/or password'
      redirect_to admin_login_path
    end
  end

  def logged_in(user)
    Session.user = user
    session[:user_id] = user.id
    session[:email] = user.email
  end

  def logout
    session.delete(:user_id)
    session.delete(:email)
    redirect_to admin_login_path
  end
end
