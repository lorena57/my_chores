class ChoresController < ApplicationController

    get '/chores' do 
        authorize
        erb :'chores/index'
    end
    
end