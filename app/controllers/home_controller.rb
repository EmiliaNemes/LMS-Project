class HomeController < ApplicationController
  #skip_before_action :verify_authenticity_token
  before_action :authenticate_user!, only: [:dashboard]
  before_action :set_current_user, only: [:dashboard]
  before_action :set_current_school, only: [:dashboard]

  def set_current_user
    @current_user = current_user
  end

  def set_current_school
    #@current_school = School.where(:school_id => current_user.school_id)
  end

  def dashboard
  end

  def index
  end

  def show_users
    @users = User.where(:school_id => current_user.school_id)
  end

  def assignment_creation
    @types = Array.[](nil, "Essay", "Quiz")
  end

  def choose_type
    if params[:type]
        if params[:type] == "Essay"
          redirect_to new_essay_path
        elsif params[:type] == "Quiz"
          redirect_to new_quize_path 
        else
          redirect_to creation_path, alert: 'Please choose a type!'
        end
    else
      redirect_to creation_path, alert: 'Please choose a type!'
    end
  end

end
