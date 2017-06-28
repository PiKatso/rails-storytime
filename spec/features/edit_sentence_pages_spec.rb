require 'rails_helper'

describe 'visiting the sentence edit page, editing a sentence' do
  it 'navigates to the sentence edit page' do
    irony = Story.create(:title => 'Irony')
    image = Image.create(:url => "http://dang.com")
    sentence = irony.sentences.create(:content => 'Hello this is my cool sententce', :author => 'Snoopy', :image_id => image.id)
    visit story_path(irony)
    click_link sentence.content
    click_link 'Edit'
    fill_in 'Content', :with => 'This is my new content'
    click_on 'Update Sentence'
    expect(page).to have_content irony.title
  end
end
