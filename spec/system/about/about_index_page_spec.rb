# spec/system/about/about_index_page_spec.rb

require 'rails_helper'

RSpec.describe 'About Index Page', type: :system do
  let(:user) { create(:user) }

 before do
    driven_by(:rack_test)
    sign_in user
  end

  it 'displays the About Us section' do
    visit about_path

    expect(page).to have_content('About Us')
  end

  it 'has a link to the Suicide and Crisis Lifeline' do
    visit about_path

    expect(page).to have_link(href: 'https://988lifeline.org')
  end

  it 'displays the mission statement' do
    visit about_path

    expect(page).to have_content('The mission of Memento Mori is to normalize grief.')
  end

  it 'displays information about Memento Mori services' do
    visit about_path

    expect(page).to have_content('With Memento Mori, you can anonymously write postcards on our Postcards page to anyone who isn\'t here any longer and have your words displayed on our feed.')
    expect(page).to have_content('On our Candles page, you can light virtual candles to honor the departed.')
  end

  it 'displays the disclaimer about abusive content' do
    visit about_path

    expect(page).to have_content('Please note that any postcards containing racist, homophobic, misogynistic, transphobic, xenophobic, ableist, or otherwise abusive content will be removed.')
    expect(page).to have_content('Bigots will not be granted entry into our little corner of the Great Beyond.')
  end
end
