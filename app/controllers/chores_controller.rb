class ChoresController < ApplicationController

    get '/chores' do 
        authorize
        @chores = Chore.all
        erb :'chores/index'
    end

    #Create a chore

    get '/chores/new' do
        authorize
        erb :'chores/new'
    end

    post '/chores' do
        authorize
        u = current_user
        new_chore = u.chores.build(task: params[:task])
        if new_chore.save!
            redirect '/chores'
        else
            @message = "There was an issue"
            erb :'/chores/new'
        end
    end

        #Delete a chore

    delete '/chores/:id' do
        authorize
        chore = Chore.find_by(id: params[:id])
        if chore
            chore.destroy
            redirect '/chores'
        end
    end

       
#Edit a chore
    get '/chores/:id/edit' do
        @chore = Chore.find_by(id: params[:id])
        
        erb :'chores/edit'
 
    end

    patch '/chores/:id' do
        @chore = Chore.find_by(id: params[:id])
        authenticate_user(@chore)
        @chore.update(task: params[:task])
        redirect '/home'
    end








    
end