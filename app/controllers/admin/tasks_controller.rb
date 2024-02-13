class Admin::TasksController < ApplicationController

  def index
    @tasks = Task.page(params[:page])
    @task = Task.new
  end

  def create
    @task = Task.new(task_params)
    if @task.save
      redirect_to edit_admin_task_path(@task)
    else
      @tasks = Task.all
      render :index
    end
  end

  def edit
    @task = Task.find(params[:id])
  end

  def update
    @task = Task.find(params[:id])
    if @task.update(task_params)
      redirect_to admin_tasks_path
    else
      render :edit
    end
  end

  def destroy
    @task = Task.find(params[:id])
    @task.destroy
    redirect_to admin_tasks_path
  end

  private

  def task_params
    params.require(:task).permit(:name)
  end

end