require "capybara/rspec"
require_relative "../../app"

feature 'delete bookmarks' do
    scenario 'lets you delete a bookmark' do
        visit '/'
        click_on('View Bookmarks')
        fill_in('new_bookmark', with: 'www.golly.com')
        fill_in('title', with: 'Golly')
        click_on('Add as Bookmark')
        click_on('Update')
        fill_in('url', with: 'www.facebook.com')
        fill_in('title', with: 'Thomas')
        click_on('Submit')
        expect(page).not_to have_content('Golly')
    end
end
