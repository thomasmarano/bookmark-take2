require 'bookmark'


describe Bookmark do
    describe '#all' do
        it 'responds to all' do
            expect(Bookmark).to respond_to(:all)
            Bookmark.all
        end

        it 'displays a list of bookmarks' do
            connection = PG.connect(dbname: 'bookmark_manager_test')

            bookmark = Bookmark.create('https://www.twitter.com', 'Twitter')
            Bookmark.create('https://www.google.com', 'Google')
            Bookmark.create('https://www.facebook.com', 'Facebook')
            bookmarks = Bookmark.all

            expect(bookmarks.length).to eq(3)
            expect(bookmarks.first.id).to eq(bookmark.id)
            expect(bookmarks.first.url).to eq(bookmark.url)
            expect(bookmarks.first.title).to eq(bookmark.title)
        end
    end

    describe '#create' do
        it 'adds a new bookmark to database' do
            bookmark = Bookmark.create('https://www.edley.com', 'Edley')
            expect(bookmark.url).to eq('https://www.edley.com')
            expect(bookmark.title).to eq('Edley')
        end
    end
end
