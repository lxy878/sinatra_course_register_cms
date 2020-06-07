class CategoryController < ApplicationController
    # testing the category routes by localhost+'/categories'
    get '/categories' do
        @categories = Category.all
        erb :'categories/index'
    end

    get '/categories/new' do
        @departments = Department.all
        erb :'categories/new'
    end

    post '/categories' do
        if !params[:category][:title].empty?
            new_category = Category.create(params[:category])
            redirect "/categories/#{new_category.id}"
        else
            flash[:category_error]='* Title is Missing'
            redirect '/categories/new'
        end
    end

    get '/categories/:id' do
        @category = Category.find(params[:id])
        @departments = @category.departments
        erb :'categories/show'
    end
end