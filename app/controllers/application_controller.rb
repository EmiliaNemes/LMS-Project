class ApplicationController < ActionController::Base

    def after_sign_in_path_for(resource)
        stored_location_for(resource) || home_dashboard_path
    end

    private
    
    #def current_user
    #    token = request.headers["Authorization"].to_s
    #    User.find_for_database_authentication(authentication_token: token)
    #end
end
