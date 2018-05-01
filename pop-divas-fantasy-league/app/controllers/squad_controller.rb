class SquadController < ApplicationController


  get '/squads/new' do
    if !logged_in?
      redirect '/login'
    else
      erb :'/squads/new'
    end
  end

   get '/squads' do
     if !logged_in?
       redirect '/login'
     else
       @user = current_user
       erb :'squads/squads_index'
     end
   end


   post '/squads' do
     @squad = Squad.create(params[:squad])
     @squad.user_id = current_user.id
     @squad.save
     redirect '/squads'
   end


   get '/squads/:id' do
     if !logged_in?
       redirect '/login'
    else
       @squad = Squad.find(params[:id])
       erb :'squads/show_squad'
     end
   end

   get '/squads/:id/edit' do
     if !logged_in?
       redirect '/login'
     end
       @squad = Squad.find(params[:id])
       erb :'squads/edit'
     end

   patch '/squads/:id' do
     @squad = Squad.find(params[:id])
     if @squad.user_id == current_user.id
       @squad.update(params[:squad])
       @squad.save
       redirect "/squads/#{@squad.id}"
     else
       erb :'/squads/error'
     end
   end

   delete '/squads/:id/delete' do
      @squad = Squad.find(params[:id])
      if @squad.user_id == current_user.id
        @squad.delete
       redirect '/squads'
     else
       erb :'/squads/error'
     end
   end

end
