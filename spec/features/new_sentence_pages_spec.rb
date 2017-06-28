require 'rails_helper'

describe 'visit root route to story path' do
  it 'navigates from root to story path' do
    irony = Story.create(:title => 'Irony')
    image = Image.create(:url => "http://dang.com")
    sentence = irony.sentences.create(:content => 'Hello this is my cool sententce', :author => 'Snoopy', :image_id => image.id)
    visit story_path(irony)
    click_link 'Create Sentence'
    fill_in 'Content', :with => "Capybara lives here. This is a good sentence"
    fill_in 'Author', :with => "Crocodile Dundee"
    click_on 'Create Sentence'
    expect(page).to have_content sentence.content
  end
end
