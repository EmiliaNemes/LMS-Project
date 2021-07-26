class ApplicationController < ActionController::Base

    def after_sign_in_path_for(resource)
        #stored_location_for(resource) || root_path
        
        session[:subdomain] = School.find(current_user.school_id).subdomain
        root_url(subdomain: session[:subdomain])
    
    end

end
