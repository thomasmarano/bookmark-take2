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

    describe '#delete' do
        it 'deletes a bookmark from the database' do
            bookmark = Bookmark.create('http://www.google.com', 'Google')
            Bookmark.delete(bookmark.id)
            expect(Bookmark.all.length).to eq(0)
        end
    end

    describe '#update' do
        it 'updates the title and url of existing bookmark' do
            bookmark = Bookmark.create('http://www.google.com', 'Google')
            updated_bookmark = Bookmark.update('Facebook', 'www.facebook.com', bookmark.id)

            expect(updated_bookmark.title).to eq('Facebook')
            expect(updated_bookmark.url).to eq('www.facebook.com')

        end
    end
end
