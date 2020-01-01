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
            @messages = "There was an issue"
            erb :'/chores/new'
        end
    end

    





    
end