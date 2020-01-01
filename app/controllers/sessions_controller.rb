class SessionsController < ApplicationController
    
    #Routes for user to login
    get '/login' do
        redirect '/chores' if logged_in?
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
        redirect '/chores' if logged_in?
        erb :'sessions/signup'
    end

    post '/users' do
        @user = User.create(username: params[:username], password: params[:password])
        if @user.errors.any?
            erb :'sessions/signup'
        else
            session[:user_id] = @user.id
            redirect '/chores'
        end
    end

    delete  '/logout' do
        session.clear
        redirect '/login'
    end

end