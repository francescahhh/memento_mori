FactoryBot.define do
    factory :note do
      title { "Sample Note Title" }
      recipient { "Recipient" }
      body { "This is the body of the sample note." }
      association :user
    end
  end
  