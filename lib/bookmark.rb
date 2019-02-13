require 'pg'
require_relative 'databaseconnection'

class Bookmark

    attr_reader :id, :url, :title

    def initialize(id, url, title)
        @id = id
        @url = url
        @title = title
    end


    def self.all
        result = DatabaseConnection.query("SELECT * FROM bookmarks;")
        result.map do |bookmark|
            Bookmark.new(bookmark['id'], bookmark['url'], bookmark['title'])
        end
    end


    def self.create(url, title)
      result = DatabaseConnection.query("INSERT INTO bookmarks (url, title) VALUES ('#{url}', '#{title}') RETURNING id, url, title")
      Bookmark.new(result[0]['id'], result[0]['url'], result[0]['title'])
    end


    def self.delete(id)
      result = DatabaseConnection.query("DELETE FROM bookmarks WHERE id= #{id}")
    end


    def self.update(title, url, id)
      result = DatabaseConnection.query("UPDATE bookmarks SET title= '#{title}', url = '#{url}' WHERE id = '#{id}' RETURNING id, url, title;")
      Bookmark.new(result[0]['id'], result[0]['url'], result[0]['title'])
    end

    
end
