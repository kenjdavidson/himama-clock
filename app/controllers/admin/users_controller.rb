# Manage User(s)
#
# Requires an active user session.
#
class Admin::UsersController < ApplicationController
  include AuthenticatedConcern

  before_action :user, only: %i[edit update destroy]
  before_action :authenticate_session

  def index
    @users = User.all
  end

  def show; end

  def create; end

  def edit
    flash[:notice] = "User with id #{params[:id]} was not found"
    redirect_to admin_user_path unless user
  end

  def update; end

  def destroy
    if user&.destroy
      flash[:notice] = "User #{user.full_name} was deleted"
    else
      flash[:error] = "User #{user.full_name} was not deleted"
    end

    redirect_to admin_user_path
  end

  private

  def user
    @user ||= User.find(params[:id])
  end

  def authenticate_session
    redirect_to profile_path unless Session.user.has_role?(:admin)
  end
end
