require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'associations' do
    it { should have_many(:notes) }
    it { should have_many(:candles) }
  end

  describe 'validations' do
    it { should validate_presence_of(:email) }
    it { should validate_uniqueness_of(:email).case_insensitive }
    it { should validate_presence_of(:password) }
    it { should validate_length_of(:password).is_at_least(6) }
  end

  describe 'devise modules' do
    it 'should have database_authenticatable module' do
      expect(User.devise_modules).to include(:database_authenticatable)
    end

    it 'should have registerable module' do
      expect(User.devise_modules).to include(:registerable)
    end

    it 'should have recoverable module' do
      expect(User.devise_modules).to include(:recoverable)
    end

    it 'should have rememberable module' do
      expect(User.devise_modules).to include(:rememberable)
    end

    it 'should have validatable module' do
      expect(User.devise_modules).to include(:validatable)
    end
  end
end
