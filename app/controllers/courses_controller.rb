class CoursesController < ApplicationController
  before_action :set_course, only: %i[ show edit update destroy ] 
  before_action :set_all_users, only: %i[ add_user ] 
  #before_action :set_courses_users, only: %i[ all_users ] 

  # GET /courses or /courses.json
  def index
    @courses = Course.all
  end

  # GET /courses/1 or /courses/1.json
  def show
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
    @course.destroy
    respond_to do |format|
      format.html { redirect_to courses_url, notice: "Course was successfully destroyed." }
      format.json { head :no_content }
    end
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

    def all_users
    end

    def add_user
      @users = User.where(:school_id => current_user.school_id)
    end

    def add_user_to_course
      puts "%% IN: " + "add_user_to_course"
      @users_courses = UsersCourses.new(:user_id => user.id, :course_id => @course.id, is_teacher => user.teacher)

      if @users_courses.save
        puts "OKK"
      else
        puts "NOOOOO"
      end
    end

    def set_all_users
      # all users from this school
      @users = User.where(:school_id => current_user.school_id)
    end

    def set_courses_users
      # all users from this school and this course
      @users = User.where(:school_id => current_user.school_id)
      #@users_courses = UsersCourses.where(:course_id => @course.id)
      #puts @users_courses.inspect
      #@users = User.where(:id => @users_courses.user_id)
      #puts @users.inspect
    end
end
