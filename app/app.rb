require 'sinatra/base'
require './app/models/link'
ENV['RACK_ENV'] ||= 'development'

class BookmarkManager < Sinatra::Base
  get '/' do
    erb :index
  end

  get '/links' do
    @links = Link.all
    erb :'links/index'
  end

  get '/links/new' do
    erb :'/links/new_link'
  end

  post '/links' do
    Link.create(url: params[:url], title: params[:title], tags: params[:tags])
    redirect '/links'
  end
end
