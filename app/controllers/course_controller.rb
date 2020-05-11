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

    get '/courses/:id' do
        'course'
    end

    get '/courses/:id/edit' do
        'edit'
    end

    delete '/courses/:id' do
        
    end
end