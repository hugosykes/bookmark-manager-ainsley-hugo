require 'sinatra/base'
require './app/models/link'
require './app/models/tag'
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
    link = Link.create(url: params[:url], title: params[:title])
    tag = Tag.create(name: params[:tags])
    link.tags << tag
    link.save
    redirect '/links'
  end
end
