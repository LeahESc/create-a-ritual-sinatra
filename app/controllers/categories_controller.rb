class CategoriesController < ApplicationController

    get '/categories' do 
        erb :'categories/index'
    end
end 