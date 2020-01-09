#ApplicationController inherits from Sinatra::Base 
#controllers define HTTP methods, like 'get' & 'post'

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

    get '/home' do
        authorize
        erb :home
    end



    helpers do
        
        #if user id is nil, I will not be logged in,
        #if it's not nil, I will be logged in.
        def logged_in?
            !!session[:user_id]
        end

        def current_user
            @current_user ||= User.find_by_id(session[:user_id])
        end

        # def current_user
        #     User.find_by(id: session[:user_id])
        # end



        def authorize
            if !logged_in? || current_user.nil?
                redirect '/login'
            else
                @user = current_user
                @user_chores = current_user.chores
                @user_gadgets = current_user.gadgets
            end
        end

        # def authorized?
        #     !!logged_in? && !current_user.nil?
        # end

        def authenticate_user(chore)
            if !chore || current_user != chore.user
            redirect '/chores'
            end
        end

        def authorized?(chore)
            chore.user == current_user 
        end

        # def authorized?
        #     !!logged_in? && !current_user.nil?
        # end



    end



end