require 'rails_helper'

RSpec.describe Note, type: :model do
  let(:user) { create(:user) }
  let(:note) { build(:note, user: user) }

  describe 'associations' do
    it { should belong_to(:user) }
  end

  describe 'validations' do
    it { should validate_presence_of(:title) }
    it { should validate_length_of(:title).is_at_most(35) }
    it { should validate_presence_of(:body) }
    it { should validate_length_of(:body).is_at_most(610) }
  end

  describe 'valid note' do
    it 'is valid with valid attributes' do
      expect(note).to be_valid
    end

    it 'is not valid without a title' do
      note.title = nil
      expect(note).to_not be_valid
    end

    it 'is not valid with a title longer than 35 characters' do
      note.title = 'a' * 36
      expect(note).to_not be_valid
    end

    it 'is not valid without a body' do
      note.body = nil
      expect(note).to_not be_valid
    end

    it 'is not valid with a body longer than 610 characters' do
      note.body = 'a' * 611
      expect(note).to_not be_valid
    end
  end
end