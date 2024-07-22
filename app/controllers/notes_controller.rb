class NotesController < ApplicationController
  before_action :set_note, only: %i[ show edit update destroy ]

  def index
    @notes = Note.all
  end

  def show
  end

  def new
    @note = Note.new
  end

  def edit
  end

  def create
    @note = Note.new(note_params)
    @note.user = current_user     

    if @note.save
      redirect_to notes_path, notice: "Postcard created!"
    else
      render :new, status: :unprocessable_entity
    end
  end

  def update
      if @note.update(note_params)
        redirect_to notes_path, notice: "Postcard updated."
      else
      render :edit, status: :unprocessable_entity 
    end
  end

  def destroy
    @note.destroy!
    redirect_to notes_path, notice: "Postcard deleted."
  end

  private
  def set_note
    @note = Note.find(params[:id])
  end

    def note_params
      params.require(:note).permit(:title, :body, :recipient)
    end

    def user_notes
      @user_notes = Note.where(user_id: current_user.id)
    end
end