class Admin::SchedulesController < ApplicationController
  before_action :authenticate_admin!

  def index
    @schedules = Schedule.all
    @schedule = Schedule.new
  end

  def new
    @schedule = Schedule.new
    @schedule.task_managers.build
  end

  def create
   @schedule = Schedule.new(schedule_params)
   if @schedule.save
    flash[:notice] = "正常に保存されました"
    redirect_to admin_schedules_path
   else
    flash.now[:alert] = '保存に失敗しました。'+ @schedule.errors.full_messages.join(', ')
    render :new
   end
  end


  def show
    @schedule = Schedule.find(params[:id])
  end

  def edit
    @schedule = Schedule.find(params[:id])
  end

  def update
    @schedule = Schedule.find(params[:id])

    if @schedule.update(schedule_params)
      flash[:notice] = "正常に更新されました"
      redirect_to admin_schedules_path
    else
      flash.now[:alert] = '保存に失敗しました。'+ @schedule.errors.full_messages.join(', ')
      render :edit
    end
  end

  def destroy
    @schedule = Schedule.find(params[:id])
    @schedule.destroy
    flash[:notice] = "正常に削除されました"
    redirect_to admin_schedules_path
  end

  private

  def schedule_params
    params.require(:schedule).permit(:name,:place_id,:scheduled_date,:confirmed_date,:task_id,task_managers_attributes: [:id, :task_id, :_destroy,:completed,:deadline_date])
  end


end
