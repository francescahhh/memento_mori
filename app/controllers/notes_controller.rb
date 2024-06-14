class NotesController < ApplicationController

  def index
    @notes = Note.all
  end

  def show
    @note = Note.find(params[:id])
  end

  def new
    @note = Note.new
  end

  def create
    @note = Note.new(note_params)
    @note.user = current_user     

    if @note.save!
      redirect_to notes_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  def destroy
    @note = Note.find(params[:id])
    @note.destroy!
    redirect_to notes_path
  end

  private
    def note_params
      params.require(:note).permit(:title, :body)
    end

    def user_notes
      @user_notes = Note.where(user_id: current_user.id)
    end
end