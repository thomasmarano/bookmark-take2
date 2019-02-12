require 'databaseconnection'

describe DatabaseConnection do


  describe '#setup' do
    it 'responds to database setup the method' do
      expect(DatabaseConnection).to respond_to(:setup).with(1).argument
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
