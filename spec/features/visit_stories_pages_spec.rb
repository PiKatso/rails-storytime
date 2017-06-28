require 'rails_helper'
# require 'database_cleaner'

# DatabaseCleaner.strategy = :truncation

describe 'visit root route to story path' do
  it 'navigates from root to story path' do
    irony = Story.create(:title => 'Irony')
    visit stories_path
    click_link 'Irony'
    expect(page).to have_content 'Irony'
  end
end
# DatabaseCleaner.clean
