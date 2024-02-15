class Public::NotesController < ApplicationController
  before_action :authenticate_customer!
  def index
    @notes = Note.order(created_at: :desc).page(params[:page])
  end

  def show
    @note = Note.find(params[:id])
  end


end
