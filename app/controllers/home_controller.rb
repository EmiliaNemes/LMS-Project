class HomeController < ApplicationController
  before_action :set_current_user
  before_action :set_current_school

  def set_current_user
    @current_user = current_user
  end

  def set_current_school
    @current_school = School.where(:school_id => current_user.school_id)
  end

  def index
    @current_user = current_user
  end

  def show_users
    @users = User.where(:school_id => current_user.school_id)
  end

end
