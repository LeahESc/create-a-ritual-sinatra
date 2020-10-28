class CategoriesController < ApplicationController

    get '/categories' do
        if logged_in? 
            @categories = current_user.categories.uniq
            @rituals = current_user.rituals.uniq
            erb :'categories/index'
        else  
            redirect '/login'
        end 
    end

    get '/categories/:id' do
        if logged_in? 
            @category = current_user.categories.find_by(id: params[:id])
            if @category
                @rituals = current_user.rituals.where(category_id: params[:id])
                erb :'categories/show'
            else  
                redirect '/categories'
            end
        else  
            redirect '/login'
        end
    end 
end 