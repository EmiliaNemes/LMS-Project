class QuizesController < ApplicationController
  before_action :set_quize, only: %i[ show edit update destroy ]
  after_action :assign_to_users, only: %i[ create ]

  # GET /quizes or /quizes.json
  def index
    @quizes = Quize.all
  end

  # GET /quizes/1 or /quizes/1.json
  def show
    @quiz_questions = QuizQuestion.where(:quize_id => @quize.id)
  end

  # GET /quizes/new
  def new
    @quize = Quize.new
  end

  # GET /quizes/1/edit
  def edit
  end

  # POST /quizes or /quizes.json
  def create
    @quize = Quize.new(quize_params)
    @quize.course_id = session[:course_id]

    respond_to do |format|
      if @quize.save
        session[:quiz_id] = @quize.id
        #format.html { redirect_to @quize, notice: "Quize was successfully created." }
        format.html { redirect_to new_quiz_question_path(), notice: "Quize was successfully created." }
        format.json { render :show, status: :created, location: @quize }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @quize.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /quizes/1 or /quizes/1.json
  def update
    respond_to do |format|
      if @quize.update(quize_params)
        format.html { redirect_to @quize, notice: "Quize was successfully updated." }
        format.json { render :show, status: :ok, location: @quize }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @quize.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /quizes/1 or /quizes/1.json
  def destroy
    @quize.destroy
    respond_to do |format|
      format.html { redirect_to quizes_url, notice: "Quize was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  def assign_to_users
    @users_of_course = UsersCourse.where(:course_id => session[:course_id])
    @users_of_course.each do |uc|
      @quiz_solution = QuizSolution.new(:quize_id => @quize.id, :student_id => uc.user_id)
    
      if !@quiz_solution.save
        redirect_back(fallback_location: root_path) #notice with error message
      end
    end
  end

  def solution
    @current_questions = QuizQuestion.where(:quize_id => session[:quiz_id])
    contor = 0
    @current_questions.each do |quest|
      @current_answers = QuizAnswer.where(:quiz_question_id => quest.id)
      correct = true
      
      @current_answers.each do |answ|
        if params[:answers].include? answ.id.to_s 
          if !answ.is_correct
            correct = false
            break
          end
          params[:answers].delete(answ.id.to_s)
        end
      end

      if correct
        contor += 1
      end
    end

    @quiz_solution = QuizSolution.find_by_student_id_and_quize_id(current_user.id, session[:quiz_id])
    grade = contor*9/@current_questions.length() + 1

    @quiz_solution.update_attribute(:grade, grade)
    redirect_to assignments_show
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_quize
      @quize = Quize.find(params[:id])
      session[:quiz_id] = @quize.id
    end

    # Only allow a list of trusted parameters through.
    def quize_params
      params.require(:quize).permit(:name, :description, :deadline, :submit_time, :course_id)
    end
end
