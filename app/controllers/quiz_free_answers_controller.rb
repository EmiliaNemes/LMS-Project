class QuizFreeAnswersController < ApplicationController
  before_action :set_quiz_free_answer, only: %i[ show edit update destroy ]

  # GET /quiz_free_answers or /quiz_free_answers.json
  def index
    @quiz_free_answers = QuizFreeAnswer.all
  end

  # GET /quiz_free_answers/1 or /quiz_free_answers/1.json
  def show
  end

  # GET /quiz_free_answers/new
  def new
    @quiz_free_answer = QuizFreeAnswer.new
  end

  # GET /quiz_free_answers/1/edit
  def edit
  end

  # POST /quiz_free_answers or /quiz_free_answers.json
  def create
    @quiz_free_answer = QuizFreeAnswer.new(quiz_free_answer_params)

    respond_to do |format|
      if @quiz_free_answer.save
        format.html { redirect_to @quiz_free_answer, notice: "Quiz free answer was successfully created." }
        format.json { render :show, status: :created, location: @quiz_free_answer }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @quiz_free_answer.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /quiz_free_answers/1 or /quiz_free_answers/1.json
  def update
    respond_to do |format|
      if @quiz_free_answer.update(quiz_free_answer_params)
        format.html { redirect_to @quiz_free_answer, notice: "Quiz free answer was successfully updated." }
        format.json { render :show, status: :ok, location: @quiz_free_answer }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @quiz_free_answer.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /quiz_free_answers/1 or /quiz_free_answers/1.json
  def destroy
    @quiz_free_answer.destroy
    respond_to do |format|
      format.html { redirect_to quiz_free_answers_url, notice: "Quiz free answer was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_quiz_free_answer
      @quiz_free_answer = QuizFreeAnswer.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def quiz_free_answer_params
      params.require(:quiz_free_answer).permit(:quiz_question_id, :free_answer, :points)
    end
end
