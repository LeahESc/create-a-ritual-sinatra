class RitualsController < ApplicationController

    get "/rituals" do 
        if logged_in?
            @rituals = current_user.rituals
            # @categories.each do |c|
        erb :'rituals/index'
        else  
            redirect '/login'
        end
    end 

    get '/rituals/new' do
        if logged_in?
            @category_selected = false
            @categories = Category.all 
            erb :'rituals/new'
        else  
            redirect '/login'
        end
    end 
    
    get '/categories/:category_id/rituals/new' do
        if logged_in?
            @category_selected = true
            @category_id = params[:category_id]
            erb :'rituals/new'
        else  
            redirect '/login'
        end
    end

    post '/rituals' do 
        if logged_in?
            # binding.pry
            @ritual = current_user.rituals.build(title: params[:title], description: params[:description], category_id: params[:category_id])
            if !!params["name"] && !params["name"].empty? 
                @ritual.category = Category.find_or_create_by(name: params[:name])
            end
            if @ritual.save
                redirect '/categories'
            else  
                redirect '/rituals/new'
            end 
        else  
            redirect '/login'
        end 
    end

    get '/rituals/:id' do 
        if logged_in? 
            @ritual = current_user.rituals.find_by(id: params[:id])
            if @ritual
                erb :'rituals/show'
            else  
                redirect '/rituals'
            end 
        else  
            redirect '/login'
        end 
    end

    get '/rituals/:id/edit' do
        if logged_in?
            @ritual = current_user.rituals.find_by(id: params[:id])
            if @ritual
            erb :'rituals/edit'
            else  
                redirect '/categories'
            end 
        else  
            redirect '/login'
        end
    end

    patch '/rituals/:id' do
        if logged_in?
            @ritual = current_user.rituals.find_by(id: params[:id])
            if @ritual 
                if @ritual.update(title: params[:title], description: params[:description])
                redirect '/categories'
                else  
                redirect "/rituals/#{@ritual.id}/edit"
                end 
            else  
                redirect '/categories'
            end 
        else  
            redirect '/login'  
        end 
    end 
            

    delete '/rituals/:id/delete' do
        if logged_in? 
            @ritual = current_user.rituals.find_by(id: params[:id])
            if @ritual 
                @ritual.destroy 
                redirect '/categories'
            else  
                redirect '/categories'
            end 
        else  
            redirect '/login'
        end
    end 

end 