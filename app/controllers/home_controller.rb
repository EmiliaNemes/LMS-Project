class HomeController < ApplicationController
  
  def index
    @current_user = current_user
  end

  def show_users
    @users = User.where(:school_id => current_user.school_id)
    puts @users.inspect
  end

end
