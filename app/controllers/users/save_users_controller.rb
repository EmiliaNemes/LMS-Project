class Users::SaveUsersController < ApplicationController

    def save_users
        puts params[:first_name]
        puts params[:email]
    end
end