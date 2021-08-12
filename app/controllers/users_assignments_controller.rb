class UsersAssignmentsController < ApplicationController
  before_action :set_users_assignment, only: %i[ show edit update destroy ]

  # GET /users_assignments or /users_assignments.json
  def index
    @users_assignments = UsersAssignment.all
  end

  # GET /users_assignments/1 or /users_assignments/1.json
  def show
  end

  # GET /users_assignments/new
  def new
    @users_assignment = UsersAssignment.new
  end

  # GET /users_assignments/1/edit
  def edit
  end

  # POST /users_assignments or /users_assignments.json
  def create
    @users_assignment = UsersAssignment.new(users_assignment_params)

    respond_to do |format|
      if @users_assignment.save
        format.html { redirect_to @users_assignment, notice: "Users assignment was successfully created." }
        format.json { render :show, status: :created, location: @users_assignment }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @users_assignment.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /users_assignments/1 or /users_assignments/1.json
  def update
    respond_to do |format|
      if @users_assignment.update(users_assignment_params)
        format.html { redirect_to @users_assignment, notice: "Users assignment was successfully updated." }
        format.json { render :show, status: :ok, location: @users_assignment }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @users_assignment.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /users_assignments/1 or /users_assignments/1.json
  def destroy
    @users_assignment.destroy
    respond_to do |format|
      format.html { redirect_to users_assignments_url, notice: "Users assignment was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_users_assignment
      @users_assignment = UsersAssignment.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def users_assignment_params
      params.require(:users_assignment).permit(:user_id, :assignment_id, :is_turned_in)
    end
end
