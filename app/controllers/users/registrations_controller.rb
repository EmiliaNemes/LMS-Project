# frozen_string_literal: true

class Users::RegistrationsController < Devise::RegistrationsController
    include ApplicationHelper
    before_action :configure_sign_up_params, only: [:create]
  # before_action :configure_account_update_params, only: [:update]

  # GET /resource/sign_up
  # def new
  # end

  # POST /resource
  def create
    puts params[:user][:school_attributes]
    params[:school] = params[:user].delete(:school_attributes)

    @school = School.new(params.require(:school).permit(:name, :subdomain))

    if @school.save
        @user = User.new(params.require(:user).permit(:email, :password, :password_confirmation, :first_name, :last_name, :administrator, :teacher, :student))
        @user.school_id = @school.id
        @user.administrator = true
        @user.teacher = false
        @user.student = false

        if @user.save
          session[:school_id] = @school.id
          sign_in(@user)
        else
          puts "# ERROR WHILE SAVING USER"
        end

        redirect_to after_sign_in_path_for(@user)
      else
        puts "# ERROR WHILE SAVING SCHOOL"
    end

  end

  # GET /resource/edit
  # def edit
  #   super
  # end

  # PUT /resource
  # def update
  #   super
  # end

  # DELETE /resource
  # def destroy
  #   super
  # end

  # GET /resource/cancel
  # Forces the session data which is usually expired after sign
  # in to be expired now. This is useful if the user wants to
  # cancel oauth signing in/up in the middle of the process,
  # removing all OAuth session data.
  # def cancel
  #   super
  # end

   protected
  # If you have extra params to permit, append them to the sanitizer.
   def configure_sign_up_params
     devise_parameter_sanitizer.permit(:sign_up, keys: [:email, :password, :password_confirmation, :first_name, :last_name, :administrator, :teacher, :student, :school_id, school_attributes: [:name, :subdomain]])
   end

  # If you have extra params to permit, append them to the sanitizer.
  # def configure_account_update_params
  #   devise_parameter_sanitizer.permit(:account_update, keys: [:attribute])
  # end

  # The path used after sign up.
  # def after_sign_up_path_for(resource)
  #   super(resource)
  # end

  # The path used after sign up for inactive accounts.
  # def after_inactive_sign_up_path_for(resource)
  #   super(resource)
  # end
end
