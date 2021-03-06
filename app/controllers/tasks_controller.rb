class TasksController < ApplicationController
  before_action :set_task, only: [:show, :edit, :update, :destroy]

  def index
    @tasks = current_user.tasks.eager_load(:labels)
    @tasks = @tasks.joins(:labels).where(labels: { id: params[:label_id] }) if params[:label_id].present?
  end

  def show
    @label = Label.all
  end

  def new
    @task = Task.new
    @label = Label.new
  end

  def create
    @task = current_user.tasks.new(task_params)
    if @task.save!
      redirect_to @task, notice: "タスク「#{@task.name}」を登録しました。"
    else
      @label = Label.new
      render :new
    end
  end

  def edit
  end

  def update
    if @task.update(task_params)
      redirect_to tasks_path, notice: "タスク「#{@task.name}」を更新しました。"
    else
      render :edit, alert: "更新に失敗しました"
    end
  end

  def destroy
    @task.destroy
    redirect_to tasks_path, notice: "タスク「#{@task.name}」を削除しました。"
  end

  private

  def set_task
    @task = current_user.tasks.find(params[:id])
  end

  def task_params
    params.require(:task).permit(:name, :contents, :deadline, :priority, :status, { label_ids: [] })
  end
end
