class Public::ToDoListsController < ApplicationController
  before_action :authenticate_customer!

  def index
    @to_do_lists = TaskManager.includes(:schedule, :task).order(deadline_date: :asc)
  end
end
