class QuizSolutionsController < ApplicationController
  before_action :set_quiz_solution, only: %i[ show edit update destroy ]

  # GET /quiz_solutions or /quiz_solutions.json
  def index
    @quiz_solutions = QuizSolution.all
  end

  # GET /quiz_solutions/1 or /quiz_solutions/1.json
  def show
  end

  # GET /quiz_solutions/new
  def new
    @quiz_solution = QuizSolution.new
  end

  # GET /quiz_solutions/1/edit
  def edit
  end

  # POST /quiz_solutions or /quiz_solutions.json
  def create
    @quiz_solution = QuizSolution.new(quiz_solution_params)

    respond_to do |format|
      if @quiz_solution.save
        format.html { redirect_to @quiz_solution, notice: "Quiz solution was successfully created." }
        format.json { render :show, status: :created, location: @quiz_solution }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @quiz_solution.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /quiz_solutions/1 or /quiz_solutions/1.json
  def update
    respond_to do |format|
      if @quiz_solution.update(quiz_solution_params)
        format.html { redirect_to @quiz_solution, notice: "Quiz solution was successfully updated." }
        format.json { render :show, status: :ok, location: @quiz_solution }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @quiz_solution.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /quiz_solutions/1 or /quiz_solutions/1.json
  def destroy
    @quiz_solution.destroy
    respond_to do |format|
      format.html { redirect_to quiz_solutions_url, notice: "Quiz solution was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_quiz_solution
      @quiz_solution = QuizSolution.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def quiz_solution_params
      params.require(:quiz_solution).permit(:quize_id, :student_id, :grade)
    end
end
