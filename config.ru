require_relative './config/environment.rb'

if ActiveRecord::Base.connection.migration_context.needs_migration?
    raise 'Migrations are pending. Run `rake db:migrate` to resolve the issue.'
end
# Using PATCH, PUT and DELETE requests
use Rack::MethodOverride

use DepartmentController
use CourseController
use StudentController
use ProfessorController
run ApplicationController