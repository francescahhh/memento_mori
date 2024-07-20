class CandlesController < ApplicationController
  before_action :set_candle, only: %i[ show edit update destroy ]

  def index
    @candles = Candle.where(user_id: current_user.id)
  end

  def show
  end

  def new
    @candle = Candle.new
  end

  def edit
  end

  def create
    @candle = Candle.new(candle_params)
    @candle.user = current_user  

      if @candle.save
        redirect_to candles_path, notice: "Candle created!"
      else
        render :new, status: :unprocessable_entity
      end
    end

  def update
      if @candle.update(candle_params)
        redirect_to candles_path, notice: "Candle updated."
      else
         render :edit, status: :unprocessable_entity
      end
    end

  def destroy
    @candle.destroy!
    redirect_to candles_path, notice: "Candle deleted."
  end

  private
    def set_candle
      @candle = Candle.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def candle_params
      params.require(:candle).permit(:name, :lit)
    end
end
