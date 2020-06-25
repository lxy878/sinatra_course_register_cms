class CourseController < ApplicationController
    before '/course*' do
        authentication_required
    end

    get '/courses' do
        @dep = current_dep
        @courses = @dep.courses
        erb :'courses/index'
    end

    get '/courses/new' do
        @students = current_dep.students
        @professors = current_dep.professors
        erb :'courses/new'
    end

    post '/courses' do
        new_course = Course.create(params[:course])
        
        # code refactor -------
        new_course.create_and_add_professor(params, session[:dep_id])
        new_course.create_and_add_student(params, session[:dep_id])
        # --------- end

        redirect "/courses/#{new_course.slug}"
    end

    get '/courses/:slug' do
        @course = Course.find_by_slug(params[:slug])
        erb :'courses/show'
    end

    get '/courses/:slug/edit' do
        @course = Course.find_by_slug(params[:slug])
        @professors = current_dep.professors
        @students = current_dep.students
        erb :'courses/edit'
    end

    patch '/courses/:slug' do
        course = Course.find_by_slug(params[:slug])
        params[:course][:student_ids] ||= []
        course.update(params[:course])
        
        # code refactor ------
        course.create_and_add_professor(params, session[:dep_id])
        course.create_and_add_student(params, session[:dep_id])
        # ------- end

        redirect "/courses/#{course.slug}"
    end

    delete '/courses/:slug' do
        Course.find_by_slug(params[:slug]).destroy
        redirect '/courses'
    end
end