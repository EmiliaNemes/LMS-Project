class ClassRegistersController < ApplicationController
  before_action :set_class_register, only: %i[ show edit update destroy ]

  # GET /class_registers or /class_registers.json
  def index
    @class_registers = ClassRegister.all
  end

  # GET /class_registers/1 or /class_registers/1.json
  def show
  end

  # GET /class_registers/new
  def new
    @class_register = ClassRegister.new
  end

  # GET /class_registers/1/edit
  def edit
  end

  # POST /class_registers or /class_registers.json
  def create
    @class_register = ClassRegister.new(class_register_params)

    respond_to do |format|
      if @class_register.save
        format.html { redirect_to @class_register, notice: "Class register was successfully created." }
        format.json { render :show, status: :created, location: @class_register }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @class_register.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /class_registers/1 or /class_registers/1.json
  def update
    respond_to do |format|
      if @class_register.update(class_register_params)
        format.html { redirect_to @class_register, notice: "Class register was successfully updated." }
        format.json { render :show, status: :ok, location: @class_register }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @class_register.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /class_registers/1 or /class_registers/1.json
  def destroy
    @class_register.destroy
    respond_to do |format|
      format.html { redirect_to class_registers_url, notice: "Class register was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_class_register
      @class_register = ClassRegister.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def class_register_params
      params.require(:class_register).permit(:course_id, :assignment_id, :student_id, :grade, :grading_teacher_id)
    end
end
