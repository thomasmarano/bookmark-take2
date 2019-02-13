require "capybara/rspec"
require_relative "../../app"

feature 'Adding and viewing comments' do
  feature 'a user can add and then view a comment' do
    scenario 'a comment is added to a bookmark' do
      bookmark = Bookmark.create('http://www.makersacademy.com', 'Makers Academy')

      visit '/bookmarks'
      click_on 'Add Comment'

      fill_in 'comment', with: 'This is a test comment'
      click_on 'Submit'
      expect(page).to have_content 'this is a test comment'
    end
  end
end
