class CandleUnlitJob < ApplicationJob
  queue_as :default

  def perform(candle_id)
    Rails.logger.info "CandleUnlitJob: Trying to unlight candle with ID: #{candle_id}"
    candle = Candle.find_by(id: candle_id)
    if candle
      candle.update!(lit: false)
      Rails.logger.info "CandleUnlitJob: Successfully unlit candle with ID: #{candle_id}"
    else
      Rails.logger.warn "CandleUnlitJob: Couldn't find candle with ID: #{candle_id}"
    end
  end
end
