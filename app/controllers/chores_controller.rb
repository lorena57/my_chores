class ChoresController < ApplicationController

    get '/chores' do 
        authorize
        @chores = Chore.all
        erb :'chores/index'
    end
    
end