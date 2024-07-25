class CandlesController < ApplicationController
  before_action :set_candle, only: %i[ show edit update destroy ]
  before_action :authenticate_user!

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
        enqueue_unlit_job if @candle.lit?
        redirect_to candles_url notice: "Candle created!"

      else
        render :new, status: :unprocessable_entity
      end
    end

  def update
      if @candle.update(candle_params)
        enqueue_unlit_job if @candle.lit?
        redirect_to candles_url, notice: "Candle updated."
      else
         render :edit, status: :unprocessable_entity
      end
    end

  def destroy
    @candle.destroy!
    redirect_to candles_url, notice: "Candle deleted."
  end

  private
  def set_candle
    @candle = Candle.find(params[:id])
  end

  def candle_params
    params.require(:candle).permit(:name, :lit)
  end
    
  def enqueue_unlit_job
    if @candle.persisted?
      CandleUnlitJob.set(wait: 24.hours).perform_later(@candle.id)
    else
      Rails.logger.warn "CandlesController: Attempted to enqueue job for unsaved candle."
    end
  end
end
