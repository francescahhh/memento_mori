require 'rails_helper'

RSpec.describe Candle, type: :model do
  let(:user) { create(:user) }
  let(:candle) { build(:candle, user: user) }

  describe 'associations' do
    it { should belong_to(:user) }
  end

  describe 'validations' do
    it { should validate_presence_of(:name) }
  end

  describe 'valid candle' do
    it 'is valid with valid attributes' do
      expect(candle).to be_valid
    end

    it 'is not valid without a name' do
      candle.name = nil
      expect(candle).to_not be_valid
    end
  end
end