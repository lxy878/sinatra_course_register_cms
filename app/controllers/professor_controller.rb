class ProfessorController < ApplicationController
    before '/professor*' do
        authentication_required
    end

    get '/professors' do
        @dep = current_dep
        @professors = @dep.professors
        erb :'professors/index'
    end

    get '/professors/new' do
        @courses = current_dep.courses
        erb :'professors/new'
    end

    post '/professors' do
        new_professor = Professor.create(params[:professor])
        redirect "/professors/#{new_professor.slug}"
    end

    get '/professors/:slug' do
        @professor = Professor.find_by_slug(params[:slug])
        erb :'professors/show'
    end

    get '/professors/:slug/edit' do
        @professor = Professor.find_by_slug(params[:slug])
        @courses = current_dep.courses
        erb :'professors/edit'
    end

    patch '/professors/:slug' do
        professor = Professor.find_by_slug(params[:slug])
        professor.update(params[:professor])
        redirect "/professors/#{professor.slug}"
    end

    delete '/professors/:slug' do
        Professor.find_by_slug(params[:slug]).destroy
        redirect '/professors'
    end
end