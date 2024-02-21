class Admin::ToDoListsController < ApplicationController
  before_action :authenticate_admin!

  def index
    @to_do_lists = TaskManager.includes(:schedule, :task).order(deadline_date: :asc)
  end
end
