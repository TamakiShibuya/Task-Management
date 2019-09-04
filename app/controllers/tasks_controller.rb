class TasksController < ApplicationController
  def index
    @tasks = Task.all
  end

  def self keyword
    redirect_to root_path if params[:keyword] == ""
    split_keyword = params[:keyword].split(/[[:blank:]]+/), nil ? # => true
    minus_keyword = split_search.select {|word| word.match(/^-/) }
    split_keyword.reject!　{|word| word.match(/^-/)}
    minus_keyword.each　{|word| word.slice!(/^-/)}
    @tasks = []
    split_keyword.each do |keyword|
      next if keyword == ""
      @tasks += Task.where('name LIKE(?)', "%#{keyword}%")
    end
    @tasks.uniq!

    minus_tasks = []
    minus_keyword.each do |keyword|
      next if keyword == ""
      minus_tasks += Task.where('name LIKE(?)', "%#{keyword}%")
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
    params.require(:task).permit(:name, :contents, :created_at, :deadline)
  end
end
