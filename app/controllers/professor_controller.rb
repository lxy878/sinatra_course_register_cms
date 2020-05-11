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
        'new'
    end

    get '/professors/:slug' do
        @professor = Professor.find_by_slug(params[:slug])
        # binding.pry
        erb :'professors/show'
    end

    get '/professors/:id/edit' do
        'edit'
    end

    delete '/professors/:id' do
        'delete'
    end
end