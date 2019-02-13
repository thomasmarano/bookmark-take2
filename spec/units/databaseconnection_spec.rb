require 'databaseconnection'

describe DatabaseConnection do


  describe '#setup' do

    it 'sets up a connection to a database through PG' do
      expect(PG).to receive(:connect).with(dbname: 'bookmark_manager_test')
      DatabaseConnection.setup('bookmark_manager_test')
    end

    it 'sets up a connection that persists'do
        connection = DatabaseConnection.setup('bookmark_manager_test')
        expect(DatabaseConnection.connection).to eq(connection)
    end

    it 'runs a query through PG' do
      connection = DatabaseConnection.setup('bookmark_manager_test')
      expect(connection).to receive(:exec).with("SELECT * FROM bookmarks;")
      DatabaseConnection.query("SELECT * FROM bookmarks;")
    end
  end
end


 # DatabaseConnection.setup is a class method.
 # It takes one parameter: a database name.
 # It should set up a connection to that database,
 # which is saved as a class instance variable in Database.


# DatabaseConnection.query is a class method.
# It takes one parameter: an SQL query string.
# It should use the class instance variable
# from setup to execute that SQL query string
# on the correct database, via pg.
