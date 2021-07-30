class Users::AddingController < ApplicationController

    def add_users_manually
        @nr = (0..10).to_a
        @contor = 0

        if params[:number]
            @contor = params[:number]
        else
            @contor = 0
        end

        #puts params[:users][0][:first_name]
    end

end