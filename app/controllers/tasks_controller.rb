class TasksController < ApplicationController
  def index
    @tasks = Task.all
    redirect_to root_path if params[:search] == ""
    split_search = params[:search].split(/[[:blank:]]+/)
    minus_search = split_search.select {|word| word.match(/^-/) }
    split_search.reject! {|word| word.match(/^-/) }
    minus_search.each {|word| word.slice!(/^-/) }
    @tasks = []
    split_search.each do |search|
      next if search == ""
      @tasks += Task.where('name LIKE(?)', "%#{search}%")
    end
    @tasks.uniq!

    minus_tasks = []
    minus_search.each do |search|
      next if search == ""
      minus_tasks += Task.where('name LIKE(?)', "%#{search}%")
    end
    minus_tasks.each do |minus_task|
      @tasks.delete(minus_task)
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
    params.require(:task).permit(:name, :contents, :created_at,)
  end
end
