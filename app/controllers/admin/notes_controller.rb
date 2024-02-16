class Admin::NotesController < ApplicationController
  def index
    @notes = Note.order(created_at: :desc).page(params[:page])
  end

  def new
    @note = Note.new
  end

  def create
   @note = Note.new(note_params)
   @note.admin = current_admin
   @nost.body = simple_format(params[:note][:body])
   if @note.save
    redirect_to admin_note_path(@note)
   else
    index
    render 'index'
   end
  end

  def show
    @note = Note.find(params[:id])
  end

  def edit
    @note = Note.find(params[:id])
  end

  def update
    @note = Note.find(params[:id])
    if @note.update(note_params)
      redirect_to admin_note_path(@note)
    else
      render "edit"
    end
  end

  def destroy
    @note = Note.find(params[:id])
    @note.destroy
    redirect_to admin_notes_path
  end


  private

  def note_params
    params.require(:note).permit(:title,:body,:admin_id)
  end

end
