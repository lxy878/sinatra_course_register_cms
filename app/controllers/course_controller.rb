class CourseController < ApplicationController
before '/courses/*' do
        authentication_required
    end

    get '/courses' do
        
        'list'
    end

    get '/courses/new' do
        'new'
    end

    get '/courses/:slug' do
        'course'
    end

    get '/courses/:slug/edit' do
        'edit'
    end

    delete '/courses/:slug' do
        
    end
end