class TasksController < ApplicationController
  before_action :set_task, only: [:show, :edit, :asign, :update, :destroy]

  # GET /tasks or /tasks.json
  def index
    @status = ["未対応","対応中","完了"]
    @tasks = Task.where.not(status: 2).order(deadline: "ASC")
  end

  # GET /tasks/1 or /tasks/1.json
  def show
    @status = ["未対応","対応中","完了"]
  end

  def show_mine
    @status = ["未対応","対応中","完了"]
    @user = User.find(current_user.id)
    @tasks = @user.tasks.where.not(status: 2).order(deadline: "ASC")
  end

  # GET /tasks/new
  def new
    @task = Task.new
  end

  # GET /tasks/1/edit
  def edit
  end

  def asign
    @status = ["未対応","対応中","完了"]
    @users = User.all
  end

  # POST /tasks or /tasks.json
  def create
    @task = Task.new(task_params)
    @task.user_id = current_user.id

    respond_to do |format|
      if @task.save
        format.html { redirect_to @task, notice: "タスクを作成しました！" }
        format.json { render :show, status: :created, location: @task }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @task.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /tasks/1 or /tasks/1.json
  def update
    @task.user_id = params[:user_id]
    respond_to do |format|
      if @task.update(task_params)
        format.html { redirect_to @task, notice: "タスクを更新しました！" }
        format.json { render :show, status: :ok, location: @task }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @task.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /tasks/1 or /tasks/1.json
  def destroy
    @task.destroy
    respond_to do |format|
      format.html { redirect_to tasks_url, notice: "タスクは削除されました！" }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_task
      @task = Task.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def task_params
      params.require(:task).permit(:title, :content, :deadline, :status, :user_id)
    end
end
