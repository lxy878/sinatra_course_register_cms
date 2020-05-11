class ProfessorController < ApplicationController
    before '/professors/*' do
        authentication_required
    end

    get '/professors' do
        @dep = current_dep
        @professors = Professor.all
        erb :'professors/index'
    end

    get '/professors/new' do
        binding.pry
        erb :'professors/new'
    end

    post '/professors' do
        
        
    end

    get '/professors/:slug' do
        @professor = Professor.find_by_slug(params[:slug])
        erb :'professors/show'
    end

    get '/professors/:slug/edit' do
        
        erb :'professors/edit'
    end

    delete '/professors/:slug' do
        Professor.find_by_slug(params[:slug]).destroy
        redirect '/professors'
    end
end