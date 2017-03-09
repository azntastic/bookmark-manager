require 'sinatra/base'
require_relative 'models/link'

class BookmarkManager < Sinatra::Base

ENV["RACK_ENV"] ||= 'development'

DataMapper.setup(:default, ENV['DATABASE_URL'] || "postgres://localhost/bookmark_manager_#{ENV["RACK_ENV"]}")

  get '/' do
    'Hello World'
  end

  get '/links' do
    @links = Link.all
    erb :'links/index'
  end

  get '/links/new' do
    erb :'links/new'
  end

  post '/links' do
    DataMapper.finalize
    DataMapper.auto_upgrade!
    link = Link.create(url: params[:url], title: params[:title])
    tag = Tag.create(tag_name: params[:tag])
    link.tags << tag
    link.save
    p link.tags
    redirect '/links'
  end

end
