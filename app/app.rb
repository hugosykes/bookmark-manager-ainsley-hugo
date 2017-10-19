require 'sinatra/base'
require './app/data_mapper_setup'
ENV['RACK_ENV'] ||= 'development'

class BookmarkManager < Sinatra::Base
  enable :sessions

  get '/' do
    erb :index
  end

  post '/login' do
    session[:user] = params[:user]
    redirect '/links'
  end

  get '/links' do
    @links = Link.all
    @user = session[:user]
    erb :'links/index'
  end

  get '/links/new' do
    erb :'/links/new_link'
  end

  post '/links' do
    link = Link.create(url: params[:url], title: params[:title])
    params[:tags].split(', ').each { |tag| link.tags << Tag.first_or_create(name: tag) } if !!params[:tags]
    link.save
    redirect '/links'
  end

  get '/tags' do
    erb :'tags/filter'
  end

  post '/tags/filter' do
    redirect "/tag/#{params[:tag]}"
  end

  get '/tag/:name' do |tag|
    @links = Link.all
    @links.select! { |link| link.tags.map(&:name).include?(tag.downcase) }
    erb :'links/index'
  end
end
