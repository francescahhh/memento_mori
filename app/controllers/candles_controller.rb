class CandlesController < ApplicationController
  before_action :set_candle, only: %i[ show edit update destroy ]

  # GET /candles or /candles.json
  def index
    @candles = Candle.all
  end

  # GET /candles/1 or /candles/1.json
  def show
  end

  # GET /candles/new
  def new
    @candle = Candle.new
  end

  # GET /candles/1/edit
  def edit
  end

  # POST /candles or /candles.json
  def create
    @candle = Candle.new(candle_params)

    respond_to do |format|
      if @candle.save
        format.html { redirect_to candle_url(@candle), notice: "Candle was successfully created." }
        format.json { render :show, status: :created, location: @candle }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @candle.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /candles/1 or /candles/1.json
  def update
    respond_to do |format|
      if @candle.update(candle_params)
        format.html { redirect_to candle_url(@candle), notice: "Candle was successfully updated." }
        format.json { render :show, status: :ok, location: @candle }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @candle.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /candles/1 or /candles/1.json
  def destroy
    @candle.destroy!

    respond_to do |format|
      format.html { redirect_to candles_url, notice: "Candle was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_candle
      @candle = Candle.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def candle_params
      params.require(:candle).permit(:name, :lit)
    end
end
