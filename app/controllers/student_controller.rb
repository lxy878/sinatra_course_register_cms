class StudentController < ApplicationController
    before '/student*' do
        authentication_required
    end

    get '/students' do
        @students = Student.all
        @dep = current_dep
        erb :'students/index'
    end

    get '/students/new' do
        @courses = Course.all
        erb :'students/new'
    end

    post '/students' do
        new_student = Student.create(params[:student])
        redirect "/students/#{new_student.slug}"
    end

    get '/students/:slug' do
        @student = Student.find_by_slug(params[:slug])
        erb :'students/show'
    end

    get '/students/:slug/edit' do
        @student = Student.find_by_slug(params[:slug])
        @courses = Course.all
        erb :'students/edit'
    end

    patch '/students/:slug' do
        params[:student][:course_ids] ||= []
        student = Student.find_by_slug(params[:slug])
        student.update(params[:student])
        redirect "/students/#{student.slug}"
    end

    delete '/students/:slug' do
        student = Student.find_by_slug(params[:slug]).destroy
        redirect '/students'
    end
end