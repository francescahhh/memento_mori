require 'rails_helper'

RSpec.describe 'Candles Index Page', type: :system do
  let!(:user) { create(:user) }
  let!(:user_2) { create(:user) }
  let!(:candle_1) { create(:candle, name: "User 1 Test Candle", lit: true, user: user) }
  let!(:candle_2) { create(:candle, name: "User 2 Test Candle", lit: true, user: user_2) }

  context "when user is signed in" do
    before do
      sign_in user
      visit candles_path
    end

    it "displays the navigation bar with all links" do
      expect(page).to have_link('About Us')
      expect(page).to have_link('Postcards')
      expect(page).to have_link('Candles')
      expect(page).to have_link('Sign Out')
    end

    it "displays the candles index with only the current user's candles" do
        expect(page).to have_content(candle_1.name)
        expect(page).to_not have_content(candle_2.name)
    end

    it 'allows user to create a new candle' do
      click_link 'New Candle'
    end
  end

  context 'when user is not signed in' do
    before do
      visit candles_path
    end

    it 'does not display the candles' do 
        expect(page).to_not have_content(candle_1.name)
        expect(page).to_not have_content(candle_2.name)
    end

    it 'displays the navigation bar with only Sign In and Sign Up links' do
      expect(page).to have_link('Sign In')
      expect(page).to have_link('Sign Up')
      expect(page).not_to have_link('About Us')
      expect(page).not_to have_link('Postcards')
      expect(page).not_to have_link('Candles')
      expect(page).not_to have_link('Sign Out')
    end
  end
end
