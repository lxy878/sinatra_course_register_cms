class DepartmentController < ApplicationController
    before '/departments/*' do
        authentication_required
    end
    get '/departments/menu' do
        @dep = current_dep
        erb :menu
    end

end