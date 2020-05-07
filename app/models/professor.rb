class Professor < ActiveRecord::Base
    belongs_to :department
    has_many :courses
    has_many :students, through: :courses

end