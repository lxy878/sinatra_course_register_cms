class StudentController < ApplicationController
    before '/student*' do
        authentication_required
    end

    get '/students' do
        @dep = current_dep
        @students = @dep.students
        erb :'students/index'
    end

    get '/students/new' do
        @courses = current_dep.courses
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
        @courses = current_dep.courses
        erb :'students/edit'
    end

    patch '/students/:slug' do
        student = Student.find_by_slug(params[:slug])
        params[:student][:course_ids] ||= []
        student.update(params[:student])
        redirect "/students/#{student.slug}"
    end

    delete '/students/:slug' do
        student = Student.find_by_slug(params[:slug]).destroy
        redirect '/students'
    end
end