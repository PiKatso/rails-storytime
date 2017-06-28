require 'rails_helper'

describe 'visits a story page and edits it\'s title' do
  it 'navigates to the stories edit page' do
    irony = Story.create(:title => 'Irony')
    visit story_path(irony)
    click_link 'Edit'
    fill_in 'Title', :with => 'Googly Moogly'
    click_on 'Update Story'
    expect(page).to have_content 'Googly Moogly'
  end
end
