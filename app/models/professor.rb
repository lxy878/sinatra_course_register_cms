class Professor < ActiveRecord::Base
    belongs_to :department
    has_many :courses
    has_many :students, through: :courses
    extend Slugifiable::ClassMethods
    include Slugifiable::InstanceMethods
end