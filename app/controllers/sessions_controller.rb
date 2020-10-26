class SessionsController < ApplicationController

    get '/login' do
        if logged_in?
            redirect '/rituals'
        else
        erb :'sessions/login'
        end
    end 

    post '/login' do
        # binding.pry
        @user = User.find_by(username: params[:username])
        if @user && @user.authenticate(params[:password])
            session[:user_id] = @user.id 
            redirect "/rituals"
        else  
            redirect '/signup'
        end
    end 

    get '/logout' do
        session.clear
        redirect '/'
    end
end 