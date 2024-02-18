class Admin::SchedulesController < ApplicationController
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
    redirect_to admin_schedules_path
   else
    new
    render 'new'
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
    @schedule.update(schedule_params)
    redirect_to admin_schedules_path
  end

  def destroy
    @schedule = Schedule.find(params[:id])
    @schedule.destroy
    redirect_to admin_schedules_path
  end

  private

  def schedule_params
    params.require(:schedule).permit(:name,:place_id,:scheduled_date,:confirmed_date,:task_id,task_managers_attributes: [:id, :task_id, :_destroy,:completed,:deadline_date])
  end


end
