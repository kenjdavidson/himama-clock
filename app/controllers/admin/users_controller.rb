# Manage User(s)
#
# Requires an active user session.
#
class Admin::UsersController < ApplicationController
  include AuthenticatedConcern

  before_action :user, only: %i[edit update destroy]

  def index
    @users = User.all
  end

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
end
