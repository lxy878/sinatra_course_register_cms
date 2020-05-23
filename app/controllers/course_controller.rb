class CourseController < ApplicationController
before '/courses/*' do
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
        if params.has_key?(:student) && !params[:student][:name].empty?
            params[:student][:department_id] = session[:dep_id]
            new_course.students << Student.create(params[:student]) 
        end
        if params.has_key?(:professor) && !params[:professor][:name].empty?
            params[:professor][:department_id] = session[:dep_id]
            new_course.professor = Professor.create(params[:professor])
            new_course.save
        end
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
        course.update(params[:course])
        if params.has_key?(:professor) && !params[:professor][:name].empty?
            params[:professor][:department_id] = session[:dep_id]
            course.professor = Professor.create(params[:professor])
            course.save
        end

        if params.has_key?(:student) && !params[:student][:name].empty?
            params[:student][:department_id] = session[:dep_id]
            course.students << Student.create(params[:student]) 
        end
        redirect "/courses/#{course.slug}"
    end

    delete '/courses/:slug' do
        Course.find_by_slug(params[:slug]).destroy
        redirect '/courses'
    end
end