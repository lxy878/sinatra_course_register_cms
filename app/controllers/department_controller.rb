class DepartmentController < ApplicationController
    before '/departments/*' do
        authentication_required
    end
    get '/departments/menu' do
        @dep = current_dep
        @courses = Course.all
        @students = Student.all
        @professors = Professor.all
        erb :menu
    end

end