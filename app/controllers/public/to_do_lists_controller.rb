class Public::ToDoListsController < ApplicationController
  def index
    @to_do_lists = TaskManager.includes(:schedule, :task).order(deadline_date: :asc)
  end
end
