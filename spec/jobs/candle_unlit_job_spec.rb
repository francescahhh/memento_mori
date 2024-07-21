require 'rails_helper'

RSpec.describe CandleUnlitJob, type: :job do
  let(:user) { create(:user) }
  let(:candle) { create(:candle, user: user) }

  it "sets the candle's lit attribute to false" do
    CandleUnlitJob.perform_now(candle.id)
    candle.reload
    expect(candle.lit).to be_falsey
  end
end