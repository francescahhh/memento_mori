require 'rails_helper'

RSpec.describe 'Notes Index Page', type: :system do
  let!(:user) { create(:user) }
  let!(:user_2) { create(:user) }
  let!(:note_1) { create(:note, title: "User 1 Test Note", body: "This is a test note from User 1", user: user) }
  let!(:note_2) { create(:note, title: "User 2 Test Note", body: "This is a test note from User 2", user: user) }

  context 'when user is signed in' do
    before do
      sign_in user
      visit notes_path
    end

    it 'displays the navigation bar with all links' do
      expect(page).to have_link('About Us')
      expect(page).to have_link('Postcards')
      expect(page).to have_link('Candles')
      expect(page).to have_link('Sign Out')
    end

    it 'displays the notes index with all notes' do
        expect(page).to have_content(note_1.title)
        expect(page).to have_content(note_1.body)
        expect(page).to have_content(note_2.title)
        expect(page).to have_content(note_2.body)
    end

    it 'allows user to create a new note' do
      find('#new-note').click
    end
  end

  context 'when user is not signed in' do
    before do
      visit notes_path
    end

    it 'does not display the notes' do 
        expect(page).to_not have_content(note_1.title)
        expect(page).to_not have_content(note_1.body)
        expect(page).to_not have_content(note_2.title)
        expect(page).to_not have_content(note_2.body)
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
