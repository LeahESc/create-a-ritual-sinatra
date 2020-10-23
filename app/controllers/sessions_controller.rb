class SessionsController < ApplicationController

    get '/login' do
        if logged_in?
            redirect '/users/index'
        else
        erb :'sessions/login'
        end
    end 

    post '/login' do
        @user = User.find_by(params[:username], params[:password])
        if @user && @user.authenticate
            session[:user_id] = @user.id 
            redirect "/users/#{@user.id}"
        else  
            redirect 'users/new'
        end
    end 
end 