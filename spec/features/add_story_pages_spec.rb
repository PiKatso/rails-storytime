require 'rails_helper'

describe 'visiting the sentence edit page, editing a sentence' do
  it 'navigates to the sentence edit page' do
    visit stories_path
    click_link 'New Story'
    fill_in 'Title', :with => 'Daaaaang'
    click_on 'Create Story'
    expect(page).to have_content 'Daaaaang'
  end
end
