class TasksController < ApplicationController
  def index
    @tasks = Task.all
  end

  def show
    @task = Task.find(params[:id])
  end

  def new
    @task = Task.new
  end

  def create
    @task = Task.new(title: params["task"][:title], details: params["task"][:details])
    @task.save
    redirect_to task_path(@task)
  end

  def edit
    @task = Task.find(params[:id])
  end

  def update
    @task = Task.find(params[:id])
    @task.update(task_params)
    redirect_to task_path(@task)
  end

  def destroy
    @task = Task.find(params[:id])
    @task.destroy
    redirect_to tasks_path
  end

  def mark_as_done_show
    @task = Task.find(params[:id])
    @task.completed = true
    @task.update(task_params_updatestatus)
    redirect_to task_path(@task)
  end

  def mark_not_done_show
    @task = Task.find(params[:id])
    @task.completed = false
    @task.update(task_params_updatestatus)
    redirect_to task_path(@task)
  end

  def mark_as_done_index
    @task = Task.find(params[:id])
    @task.completed = true
    @task.update(task_params_updatestatus)
    redirect_to tasks_path
  end

  def mark_not_done_index
    @task = Task.find(params[:id])
    @task.completed = false
    @task.update(task_params_updatestatus)
    redirect_to tasks_path
  end

  private

  def task_params
    params.require(:task).permit(:title, :details, :completed)
  end

  def task_params_updatestatus
    params.permit(:title, :details, :completed)
  end



end
