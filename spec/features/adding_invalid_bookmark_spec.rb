require "capybara/rspec"
require_relative "../../app"

feature 'invalid URL' do
    scenario 'sends an error message for invalid URL' do
        visit '/bookmarks'
        fill_in('new_bookmark', with: 'not a url')
        fill_in('title', with: 'faulty url')
        click_on('Add as Bookmark')
        expect(page).not_to have_content('faulty url')
    end
end
