class EssaySolutionsController < ApplicationController
  before_action :set_essay_solution, only: %i[ show edit update destroy ]

  # GET /essay_solutions or /essay_solutions.json
  def index
    @essay_solutions = EssaySolution.all
  end

  # GET /essay_solutions/1 or /essay_solutions/1.json
  def show
  end

  # GET /essay_solutions/new
  def new
    @essay_solution = EssaySolution.new
  end

  # GET /essay_solutions/1/edit
  def edit
  end

  # POST /essay_solutions or /essay_solutions.json
  def create
    @essay_solution = EssaySolution.new(essay_solution_params)

    respond_to do |format|
      if @essay_solution.save
        format.html { redirect_to @essay_solution, notice: "Essay solution was successfully created." }
        format.json { render :show, status: :created, location: @essay_solution }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @essay_solution.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /essay_solutions/1 or /essay_solutions/1.json
  def update
    respond_to do |format|
      @essay_solution.submit_time = DateTime.now.utc
      if @essay_solution.update(essay_solution_params)
        format.html { redirect_to assignments_show_path(), notice: "Essay solution was successfully updated." }
        format.json { render :show, status: :ok, location: @essay_solution }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @essay_solution.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /essay_solutions/1 or /essay_solutions/1.json
  def destroy
    @essay_solution.destroy
    respond_to do |format|
      format.html { redirect_to essay_solutions_url, notice: "Essay solution was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  def index_for_essay
    @essay_solutions_for_essay = EssaySolution.where(:essay_id => params[:id])
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_essay_solution
      @essay_solution = EssaySolution.find(params[:id])
      if(@essay_solution.attachments != nil)
        @attachments = @essay_solution.attachments.split(",")
      else
        @attachments = Array.new
      end
      @current_date = DateTime.now.utc
    end

    # Only allow a list of trusted parameters through.
    def essay_solution_params
      params.require(:essay_solution).permit(:essay_id, :student_id, :content, :attachments, :submit_time, :grade)
    end
end
