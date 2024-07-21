FactoryBot.define do
    factory :candle do
      name { "Sample Candle" }
      lit { true }
      association :user
    end
  end