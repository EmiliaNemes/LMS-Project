class QuizQuestionsController < ApplicationController
  before_action :set_quiz_question, only: %i[ show edit update destroy ]
  after_action :assign_free_answer_to_users, only: %i[ create ]

  # GET /quiz_questions or /quiz_questions.json
  def index
    @quiz_questions = QuizQuestion.all
  end

  # GET /quiz_questions/1 or /quiz_questions/1.json
  def show
    @quiz_answers = QuizAnswer.where(:quiz_question_id => @quiz_question.id)
    session[:quiz_question_id] = @quiz_question.id
  end

  # GET /quiz_questions/new
  def new
    @quiz_question = QuizQuestion.new
    @quiz_question.quiz_answers.build
    @types = Array.[]("Multiple Choice", "Free Answer")
  end

  # GET /quiz_questions/1/edit
  def edit
    @quiz_question.quiz_answers.build
    @types = Array.[]("Multiple Choice", "Free Answer")
  end

  # POST /quiz_questions or /quiz_questions.json
  def create
    @quiz_question = QuizQuestion.new(quiz_question_params)
    @quiz_question.quize_id = session[:quiz_id]

    respond_to do |format|
      if @quiz_question.save
        format.html { redirect_to @quiz_question, notice: "Quiz question was successfully created." }
        format.json { render :show, status: :created, location: @quiz_question }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @quiz_question.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /quiz_questions/1 or /quiz_questions/1.json
  def update
    respond_to do |format|
      if @quiz_question.update(quiz_question_params)
        format.html { redirect_to @quiz_question, notice: "Quiz question was successfully updated." }
        format.json { render :show, status: :ok, location: @quiz_question }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @quiz_question.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /quiz_questions/1 or /quiz_questions/1.json
  def destroy
    @quiz_question.destroy
    respond_to do |format|
      format.html { redirect_to quiz_questions_url, notice: "Quiz question was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  def assign_free_answer_to_users
    if @quiz_question.answer_type == "Free Answer"
      @users_of_course = UsersCourse.where(:course_id => session[:course_id])
      @users_of_course.each do |uc|
        @quiz_free_answer = QuizFreeAnswer.new(:quiz_question_id => @quiz_question.id, :student_id => uc.user_id)
        
        if !@quiz_free_answer.save
          redirect_back(fallback_location: root_path) #notice with error message
        end
      end
    end
  end 

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_quiz_question
      @quiz_question = QuizQuestion.find(params[:id])
      session[:quiz_question_id] = @quiz_question.id
    end

    # Only allow a list of trusted parameters through.
    def quiz_question_params
      params.require(:quiz_question).permit(:question, :quize_id, :answer_type, :points, quiz_answers_attributes: [:id, :_destroy, :quiz_question_id, :answer, :is_correct])
    end
end
