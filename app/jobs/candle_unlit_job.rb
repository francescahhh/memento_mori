class CandleUnlitJob < ApplicationJob
  queue_as :default

  def perform(candle_id)
    candle = Candle.find(candle_id)
    candle.update!(lit: false)
  end
end
