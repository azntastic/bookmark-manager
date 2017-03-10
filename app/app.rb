require 'sinatra/base'
require_relative 'models/link'
require_relative 'data_mapper_setup'
require_relative 'models/user'

class BookmarkManager < Sinatra::Base

ENV["RACK_ENV"] ||= 'development'

  enable :sessions

  data_mapper_config

  get '/' do
    erb :'links/homepage'
  end

  get '/links' do
    @links = Link.all
    @user = User.create(email: session['email'], password: session['pass'])
    erb :'links/index'
  end

  get '/links/new' do
    erb :'links/new'
  end

  post '/sign_up' do
    session['email'] = params[:Email]
    session['pass'] = params[:Password]
    redirect '/links'
  end

  post '/links' do
    link = Link.create(url: params[:url], title: params[:title])
    tag1 = Tag.create(tag_name: params[:tag1])
    tag2 = Tag.create(tag_name: params[:tag2])
    link.tags << tag1
    link.tags << tag2
    link.save
    redirect '/links'
  end

  get '/tags/:tag' do
    @matching_links = Link.all(Link.tags.tag_name => params['tag'])
    erb :'links/tags'
  end

  get '/sign_up' do
    erb :'sign_up/sign_up'
  end

end
