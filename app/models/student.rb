class Student < ActiveRecord::Base
    belongs_to :department
    has_many :student_courses
    has_many :courses, through: :student_courses
    has_many :professors, through: :courses
    extend Slugifiable::ClassMethods
    include Slugifiable::InstanceMethods
end