require 'sinatra/base'
require_relative 'lib/bookmark'

class BookmarkManager < Sinatra::Base

  get '/' do
   erb (:index)
  end

enable :sessions, :method_override

  get '/bookmarks' do
    @bookmarks = Bookmark.all
    erb (:bookmarks)
  end

  post '/add-bookmark' do
    Bookmark.create(params[:new_bookmark], params[:title])
    redirect '/bookmarks'
  end

  delete '/bookmarks/:id' do
    Bookmark.delete(params[:id])
    redirect '/bookmarks'
  end

  get '/bookmarks/:id/edit' do
    session[:id] = params[:id]
    erb (:bookmark_editor)
  end

  patch '/bookmarks2' do
    Bookmark.update(params[:title], params[:url], session[:id])
    redirect '/bookmarks'
  end

 run! if app_file == $0

end
