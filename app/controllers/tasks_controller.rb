class TasksController < ApplicationController
  def index
    @tasks = Task.all
    if params[:sort_column].present? && params[:sort_direction].present?
      @tasks = Task.order(params[:sort_column] + ' ' + params[:sort_direction])
    else
      @tasks = Task.order(created_at: :desc)
    end
  end

  def show
    @task = Task.find(params[:id])
  end

  def new
    @task = Task.new
  end

  def create
    @task = Task.new(task_params)
    redirect_to @task, notice: "タスク「#{@task.name}」を登録しました。" if @task.save
    render :new if @task.id.blank?
  end

  def edit
    @task = Task.find(params[:id])
  end

  def update
    task = Task.find(params[:id])
    task.update!(task_params)
    redirect_to task_url, notice: "タスク「#{task.name}」を更新しました。"
  end

  def destroy
    task = Task.find(params[:id])
    task.destroy
    redirect_to tasks_url, notice: "タスク「#{task.name}」を削除しました。"
  end

  private

  def task_params
    params.require(:task).permit(:name, :contents, :deadline, :priority, :status)
  end
end
