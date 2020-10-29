class CategoriesController < ApplicationController

    get '/categories' do
        redirect?
        @categories = current_user.categories.uniq
        @rituals = current_user.rituals.uniq
        erb :'categories/index' 
    end

    get '/categories/:id' do
        redirect? 
        @category = current_user.categories.find_by(id: params[:id])
        if @category
            @rituals = current_user.rituals.where(category_id: params[:id])
            erb :'categories/show'
        else  
            redirect '/categories'
        end
    end 
end 