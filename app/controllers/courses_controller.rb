class CoursesController < ApplicationController
  before_action :set_course, only: %i[ show edit update destroy users_of_course add_users_to_course remove ] 
  before_action :set_all_users, only: %i[ add_user ] 
  #before_action :set_courses_users, only: %i[ all_users ] 

  # GET /courses or /courses.json
  def index
    @courses = Course.all
  end

  # GET /courses/1 or /courses/1.json
  def show
    #@res = Resource.new()
    @all_resources = Resource.where(:course_id => @course.id, :lesson_id => nil)
  end

  # GET /courses/new
  def new
    @course = Course.new
  end

  # GET /courses/1/edit
  def edit
  end

  # POST /courses or /courses.json
  def create
    @course = Course.new(course_params)

    respond_to do |format|
      if @course.save
        format.html { redirect_to @course, notice: "Course was successfully created." }
        format.json { render :show, status: :created, location: @course }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @course.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /courses/1 or /courses/1.json
  def update
    respond_to do |format|
      if @course.update(course_params)
        format.html { redirect_to @course, notice: "Course was successfully updated." }
        format.json { render :show, status: :ok, location: @course }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @course.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /courses/1 or /courses/1.json
  def destroy
    @users_course = UsersCourse.where(:course_id => @course.id)
    @users_course.each do |user_course|
      UsersCourse.destroy(user_course.id)
    end

    @course.destroy
    respond_to do |format|
      format.html { redirect_to courses_url, notice: "Course was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  def users_of_course
    @users_course_from_course = UsersCourse.where(:course_id => @course.id)
    #puts @users_course_from_course.inspect

    @users = Array.new
    @users_course_from_course.each do |user_course|
      @users.push(User.find(user_course.user_id))
    end
  end

  def add_users_to_course
    @users = User.where(:school_id => current_user.school_id)
  end

  def assign_user_to_course
    @users_course = UsersCourse.new()
    @users_course.course_id = params[:id]
    @users_course.user_id = params[:user_id]
    @users_course.is_teacher = User.find(params[:user_id]).teacher

    if @users_course.save
      #puts "UsersCourse saved"
    else
      #puts "UserCourse NOT saved"
    end

    redirect_to courses_add_users_to_course_path(), notice: "New User added to course!"
  end

  def remove_user_from_course
    @users_course = UsersCourse.find_by_course_id_and_user_id(params[:id], params[:user_id])
    
    UsersCourse.destroy(@users_course.id)

    redirect_back(fallback_location: root_path) #notice with remove
  end

  def remove
    self.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_course
      @course = Course.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def course_params
      params.require(:course).permit(:name, :description)
    end

    def set_all_users
      # all users from this school
      @users = User.where(:school_id => current_user.school_id)
    end

    def set_courses_users
      # all users from this school and this course
      @users = User.where(:school_id => current_user.school_id)
    end
end
