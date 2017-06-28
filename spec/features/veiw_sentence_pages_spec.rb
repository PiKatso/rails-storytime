require 'rails_helper'

describe 'visit story path, route to sentence details' do
  it 'navigates from story path to sentence details' do
    irony = Story.create(:title => 'Irony')
    image = Image.create(:url => "http://dang.com")
    sentence = irony.sentences.create(:content => 'Hello this is my cool sententce', :author => 'Snoopy', :image_id => image.id)
    visit stories_path
    click_link 'Irony'
    click_link sentence.content
    expect(page).to have_content sentence.author
  end
end
