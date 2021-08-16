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
        # to add column if it is essay or quiz
        @current_date = DateTime.now.utc
        @current_date.strftime("%Y-%m-%d %H:%M:%s")

        @assignments = Essay.where(:course_id => session[:course_id])
        @assignments += Quize.where(:course_id => session[:course_id])

        puts "##  " + EssaySolution.find_by_essay_id_and_student_id(@assignments[0].id, current_user.id).submit_time.to_s
        puts "@@  " + Time.parse(@current_date.to_s).to_s + " vs " + Time.parse(@assignments[0].deadline.to_s).to_s
    end
end