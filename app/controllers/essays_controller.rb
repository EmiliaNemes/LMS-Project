class EssaysController < ApplicationController
  before_action :set_essay, only: %i[ show edit update destroy ]
  after_action :assign_to_users, only: %i[ create ]

  # GET /essays or /essays.json
  def index
    @essays = Essay.all
  end

  # GET /essays/1 or /essays/1.json
  def show
  end

  # GET /essays/new
  def new
    @essay = Essay.new
  end

  # GET /essays/1/edit
  def edit
  end

  # POST /essays or /essays.json
  def create
    @essay = Essay.new(essay_params)
    @essay.course_id = session[:course_id]
    puts "### Essay Inspect: " + @essay.inspect

    respond_to do |format|
      if @essay.save
        format.html { redirect_to @essay, notice: "Essay was successfully created." }
        format.json { render :show, status: :created, location: @essay }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @essay.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /essays/1 or /essays/1.json
  def update
    respond_to do |format|
      if @essay.update(essay_params)
        format.html { redirect_to @essay, notice: "Essay was successfully updated." }
        format.json { render :show, status: :ok, location: @essay }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @essay.errors, status: :unprocessable_entity }
      end
    end
  end

  def assign_to_users
    @users_of_course = UsersCourse.where(:course_id => session[:course_id])
    @users_of_course.each do |uc|
      @essay_solution = EssaySolution.new(:essay_id => @essay.id, :student_id => uc.user_id)
      
      puts "## INSPECT: " + @essay_solution.inspect
      #@essay_solution.save
    end
  end

  # DELETE /essays/1 or /essays/1.json
  def destroy
    @essay.destroy
    respond_to do |format|
      format.html { redirect_to essays_url, notice: "Essay was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_essay
      @essay = Essay.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def essay_params
      params.require(:essay).permit(:name, :description, :deadline, :course_id)
    end
end
