class QuizesController < ApplicationController
  before_action :set_quize, only: %i[ show edit update destroy ]

  # GET /quizes or /quizes.json
  def index
    @quizes = Quize.all
  end

  # GET /quizes/1 or /quizes/1.json
  def show
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
        format.html { redirect_to @quize, notice: "Quize was successfully created." }
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

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_quize
      @quize = Quize.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def quize_params
      params.require(:quize).permit(:name, :description, :deadline, :submit_time, :course_id)
    end
end
