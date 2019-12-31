class ApplicationController < Sinatra::Base

    configure do
        set :views, 'app/views'
        set :public_folder, 'public'
        enable :sessions
        set :session_secret, "oh_great_chores"
    end
    
    get '/' do
        erb :index
    end

    helpers do
        
        #if user id is nil, I will not be logged in,
        #if it's not nil, I will be logged in.
        def logged_in?
            !!session[:user_id]
        end

        def current_user
            User.find_by(id: session[:user_id])
        end

        def authorize
            if !logged_in? || current_user.nil?
                redirect '/login'
            end
        end

        def authorized?
            !!logged_in? && !current_user.nil?
        end

    end



end