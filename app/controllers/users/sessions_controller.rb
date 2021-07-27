# frozen_string_literal: true

class Users::SessionsController < Devise::SessionsController
  # before_action :configure_sign_in_params, only: [:create]

  # GET /resource/sign_in
  # def new
  #   super
  # end

  # POST /resource/sign_in
  def create
    
      school_name = params[:user][:school_attributes][:name]
      @school_id =  School.find_by_name(school_name).id
      session[:school_id] = @school_id

      user = User.find_by_email_and_school_id(current_user.email, @school_id)
      sign_out(current_user)
      sign_in(user)
      redirect_to after_sign_in_path_for(user)

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
