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
            @categories = Category.all 
            erb :'rituals/new'
        else  
            redirect '/login'
        end
    end 

    post '/rituals' do 
        # 
        if logged_in?
            @ritual = current_user.rituals.build(title: params[:title], description: params[:description], category_id: params[:category_id])
            if @ritual.save
                binding.pry
                @category = Category.all.find_by(id: @ritual.category_id)
                redirect '/rituals'
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
                redirect '/rituals'
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
                redirect '/rituals'
                else  
                redirect "/rituals/#{@ritual.id}/edit"
                end 
            else  
                redirect '/rituals'
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
                redirect '/rituals'
            else  
                redirect '/rituals'
            end 
        else  
            redirect '/login'
        end
    end 

end 