class AssignmentsController < ApplicationController

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

  def show
    @current_date = DateTime.now.utc
    @current_date.strftime("%Y-%m-%d %H:%M:%s")

    @essays = Essay.where(:course_id => session[:course_id])
    @quizes = Quize.where(:course_id => session[:course_id])
  end
end