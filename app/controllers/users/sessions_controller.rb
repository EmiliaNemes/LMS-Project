# frozen_string_literal: true

class Users::SessionsController < Devise::SessionsController
  # before_action :configure_sign_in_params, only: [:create]

  def index
    @schools = School.order(:name)
    @schools = @schools.where("name like ?", "%#{params[:name]}%") if params[:name]

    respond_to do |format|
      format.html # index.html.erb
      format.json { render :json => @schools.map(&:name) }
    end
  end

  # GET /resource/sign_in
  def new
    super
    @schools = School.pluck(:name).sort
  end

  # POST /resource/sign_in
  def create
    
      @schools = School.pluck(:name).sort
      school_name = params[:user][:school_attributes][:name]
      @school_id =  School.find_by_name(school_name).id
      session[:school_id] = @school_id

      user = User.find_by_email_and_school_id(params[:user][:email], @school_id)
      if user
        if params[:user][:password] == "" && user.encrypted_password == ""
          sign_in(user)
          redirect_to after_sign_in_path_for(user)
        elsif user.valid_password?(params[:user][:password])
            sign_in(user)
            redirect_to after_sign_in_path_for(user)
        else
            redirect_to new_user_session_path(), alert: "Username and/or Password is not correct!"
        end
      else
        redirect_to new_user_session_path(), alert: "This User does not exist in this School!"
      end
  end

  # DELETE /resource/sign_out
   def destroy
     super
   end

  # protected

  # If you have extra params to permit, append them to the sanitizer.
  # def configure_sign_in_params
  #   devise_parameter_sanitizer.permit(:sign_in, keys: [:attribute])
  # end
end
