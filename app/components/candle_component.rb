# frozen_string_literal: true

class CandleComponent < ViewComponent::Base
    def initialize(candle:)
      @candle = candle
    end
  end
  