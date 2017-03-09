require 'sinatra/base'
require_relative 'models/link'
require_relative 'data_mapper_setup'

class BookmarkManager < Sinatra::Base

ENV["RACK_ENV"] ||= 'development'

  data_mapper_config

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
    link = Link.create(url: params[:url], title: params[:title])
    tag = Tag.create(tag_name: params[:tag])
    link.tags << tag
    link.save
    p link.tags
    redirect '/links'
  end

end
