class HomeController < ApplicationController
  before_action :set_current_user

  def set_current_user
    @current_user = current_user
  end

  def index
  end

  def show_users
    @users = User.where(:school_id => current_user.school_id)
  end

end
