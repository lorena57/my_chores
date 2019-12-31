class SessionsController < ApplicationController
    
    #Routes for user to login
    get '/login' do
        
        @failed = false
        erb :'sessions/login'
    end

    post '/login' do
        user = User.find_by(username: params[:username])
        if !!user && user.authenticate(params[:password])
            session[:user_id] = user.id
            redirect '/chores'
        else 
            @failed = true
            erb :'sessions/login' 
        end
    end

    #Routes for user to signup
    get '/signup' do
        erb :'sessions/signup'
    end

    post '/signup' do
        
    end

end