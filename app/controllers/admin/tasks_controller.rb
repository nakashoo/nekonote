class Admin::TasksController < ApplicationController
  before_action :authenticate_admin!

  def index
    @tasks = Task.all
    @task = Task.new
  end

  def create
    @task = Task.new(task_params)
    if @task.save
      flash[:notice] = "正常に保存されました"
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
      flash[:notice] = "正常に更新されました"
      redirect_to admin_tasks_path
    else
      render :edit
    end
  end

  def destroy
    @task = Task.find(params[:id])
    @task.destroy
    flash[:notice] = "正常に削除されました"
    redirect_to admin_tasks_path
  end

  private

  def task_params
    params.require(:task).permit(:name)
  end

end
