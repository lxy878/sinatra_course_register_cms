class Department < ActiveRecord::Base
    has_secure_password
    has_many :students
    has_many :professors
    has_many :courses
end