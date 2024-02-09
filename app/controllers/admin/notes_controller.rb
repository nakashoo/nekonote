class Admin::NotesController < ApplicationController
  def index
    @notes = Note.page(params[:page])
  end

  def new
    @note = Note.new
  end

  def create
   @note = Note.new(note_params)
   @note.admin = current_admin
   if @note.save
    redirect_to admin_note_path(@note), notice: "You have created book successfully."
   else
    index
    render 'index'
   end
  end

  def show
    @note = Note.find(params[:id])
  end

  def edit
  end

  private

  def note_params
    params.require(:note).permit(:title,:body)
  end

end
