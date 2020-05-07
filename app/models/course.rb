class Course < ActiveRecord::Base
    belongs_to :department
    has_many :student_courses
    has_many :students, through: :student_courses
    belongs_to :professor
end