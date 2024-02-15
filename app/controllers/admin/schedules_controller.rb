class Admin::SchedulesController < ApplicationController
  def index
    @schedules = Schedule.all
  end

  def new
    @schedule = Schedule.new
    @schedule.task_managers.build
  end

  def create
   @schedule = Schedule.new(schedule_params)
   if @schedule.save
    redirect_to admin_schedule_path
   else
    new
    render 'new'
   end
  end


  def show

  end

  def edit

  end

  private

  def schedule_params
    params.require(:schedule).permit(:name,:place_id,:scheduled_date,:confirmed_date,:task_id,task_managers_attributes: [:id, :task_id, :_destroy])
  end


end
