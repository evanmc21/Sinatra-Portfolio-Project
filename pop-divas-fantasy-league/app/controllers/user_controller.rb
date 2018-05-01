require 'rack-flash'
class UserController < ApplicationController

  use Rack::Flash


  get '/signup' do
    if logged_in?
      redirect '/squads'
    end
    erb :'/users/signup'
  end

  post '/signup' do
    @user = User.create(username: params[:username], email: params[:email], password: params[:password])
    session[:id] = @user.id
    if logged_in?
      redirect '/users/success'
    else
      flash[:message] = "Skrrrt! Please enter a username, email, and password to sign up."
      redirect '/signup'
    end
  end

  get '/login' do
    if logged_in?
      redirect '/squads'
    else
    erb :'/users/login'
  end
end

  post '/login' do
    @user = User.find_by(params[:user])
    if @user && @user.authenticate(params[:password])
      session[:id] = @user.id
      redirect '/squads'
    else
      flash[:message] = "Not today, Satan! Please enter a valid username and password."
      redirect '/login'
    end
  end


  get'/logout' do
    session.clear
    redirect '/'
  end

  get '/users/success' do
    @user = User.find_by_slug(params[:slug])
    erb :'users/index'
  end


end
