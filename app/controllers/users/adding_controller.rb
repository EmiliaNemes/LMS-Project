class Users::AddingController < ApplicationController
  
    def get_number
        @nr = params[:number]
    end

    def add_users
        puts "HEYY"
        puts "First one"
        #puts params[:users][0][:first_name]
    end
end