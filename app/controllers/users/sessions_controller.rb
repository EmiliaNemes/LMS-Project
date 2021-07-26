# frozen_string_literal: true

class Users::SessionsController < Devise::SessionsController
  # before_action :configure_sign_in_params, only: [:create]

  # GET /resource/sign_in
  # def new
  #   super
  # end

  # POST /resource/sign_in

  def create
    puts resource.inspect
    puts "%%%%%% SCF" + params[:school]
    school_name = params.require(:school).permit(:name)
    puts "@@@@@ kl" + school_name
    #if request.subdomain == nil

    if request.subdomain == School.find(current_user.school_id).subdomain
      redirect_to after_sign_in_path_for(current_user)
    else
      sign_out(current_user)
      redirect_to root_path, alert: "No permission"
    end
  end

  # DELETE /resource/sign_out
  # def destroy
  #   super
  # end

  # protected

  # If you have extra params to permit, append them to the sanitizer.
  # def configure_sign_in_params
  #   devise_parameter_sanitizer.permit(:sign_in, keys: [:attribute])
  # end
end
