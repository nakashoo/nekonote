class Admin::NotesController < ApplicationController
  before_action :authenticate_admin!

  def index
    @notes = Note.order(created_at: :desc).page(params[:page])
  end

  def new
    @note = Note.new
  end

  def create
   @note = Note.new(note_params)
   @note.admin = current_admin
   @note.body = params[:note][:body]
   if @note.save
    flash[:notice] = "正常に保存されました"
    redirect_to admin_note_path(@note)
   else
    render 'new'
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
      flash[:notice] = "正常に更新されました"
      redirect_to admin_note_path(@note)
    else
      render "edit"
    end
  end

  def destroy
    @note = Note.find(params[:id])
    @note.destroy
      flash[:notice] = "正常に削除されました"
      redirect_to admin_notes_path
  end


  private

  def note_params
    params.require(:note).permit(:title,:body,:admin_id)
  end

end
