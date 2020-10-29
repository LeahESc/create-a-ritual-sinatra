class RitualsController < ApplicationController

    get "/rituals" do 
        redirect?
        @rituals = current_user.rituals
            # @categories.each do |c|
        erb :'rituals/index'
    end 

    get '/rituals/new' do
        redirect?
        @category_selected = false
        @categories = Category.all 
        erb :'rituals/new'
    end 
    
    get '/categories/:category_id/rituals/new' do
        redirect?
        @category_selected = true
        @category_id = params[:category_id]
        erb :'rituals/new'
    end

    post '/rituals' do 
        redirect?
        @ritual = current_user.rituals.build(title: params[:title], description: params[:description], category_id: params[:category_id])
        if !!params["name"] && !params["name"].empty? 
            @ritual.category = Category.find_or_create_by(name: params[:name])
        end
        if @ritual.save
            redirect '/categories'
        else  
            @message = @ritual.errors.full_messages.join(". ")
            erb :'rituals/new'
        end 
    end

    get '/rituals/:id' do 
        redirect?
        set_ritual
        erb :'rituals/show'
       
    end

    get '/rituals/:id/edit' do
        redirect?
        set_ritual
        erb :'rituals/edit'
    end 

    patch '/rituals/:id' do
        redirect?
        set_ritual 
        if @ritual.update(title: params[:title], description: params[:description])
            redirect '/categories'
        else  
            redirect "/rituals/#{@ritual.id}/edit"
        end  
    end 
            

    delete '/rituals/:id/delete' do
        redirect?
        set_ritual
        @ritual.destroy 
        redirect '/categories' 
    end
    
    def set_ritual
        @ritual = current_user.rituals.find_by(id: params[:id])
        if !@ritual 
            redirect '/categories'
        end
    end


end 