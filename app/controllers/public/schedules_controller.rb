class Public::SchedulesController < ApplicationController
  before_action :authenticate_customer!

  def index
    @schedules = Schedule.all
  end

  def show
    @schedule = Schedule.find(params[:id])
  end
end
