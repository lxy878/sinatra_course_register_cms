class StudentController < ApplicationController
    before '/students/*' do
        authentication_required
    end

    get '/students' do
        
        'list'
    end

    get '/students/new' do
        'new'
    end

    get '/students/:id' do
        'student'
    end

    get '/students/:id/edit' do
        'edit'
    end

    delete '/students/:id' do
        
    end
end