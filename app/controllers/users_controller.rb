class UsersController < ApplicationController

    get '/signup' do
        erb :'users/signup'
    end 

    post '/signup' do
        # binding.pry
        @user = User.new(username: params[:username], email: params[:email], password: params[:password])
        if @user
            @user.save
            session[:user_id] = @user.id
            redirect '/categories'
        else  
            redirect '/signup'
        end
    end 
end 