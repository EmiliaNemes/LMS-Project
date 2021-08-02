require 'csv'

class Users::AddingController < ApplicationController

    def add_users_manually
        @nr = (0..10).to_a
        @contor = 0

        if params[:number]
            @contor = params[:number]
        else
            @contor = 0
        end
    end

    def import_users
        @file_name = params[:file_name]
        
        if @file_name
            CSV.foreach(@file_name, headers: true) do |row|
                firstName, lastName, email, administrator, teacher, student = row.to_s.split(/[\s\t,]/)
                user = User.new(:email => email, :first_name => firstName, :last_name => lastName, :school_id => current_user.school_id, :administrator => administrator, :teacher => teacher, :student => student)
            
                if user.save
                    redirect_to home_dashboard_path, alert: 'Users have been saved successfully!'
                else
                    ##notice: "Could not save users from chosen file!"
                    #redirect_to users_adding_import_users_path #stay here, reload this page
                end
            end
        else
            puts "The file could not be opened!"
        end
    end

    def add_users_from_file
    end
end