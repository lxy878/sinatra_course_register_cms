class DepartmentController < ApplicationController
    before '/department*' do
        authentication_required
    end
    get '/departments/menu' do
        @dep = current_dep
        @courses = @dep.courses
        @students = @dep.students
        @professors = @dep.professors
        erb :menu
    end

end