class Course < ActiveRecord::Base
    belongs_to :department
    has_many :student_courses
    has_many :students, through: :student_courses
    belongs_to :professor
    extend Slugifiable::ClassMethods
    include Slugifiable::InstanceMethods

    # code refactor ------------
    def create_and_add_professor(params, dep_id)
        if params.has_key?(:professor) && !params[:professor][:name].empty?
            params[:professor][:department_id] = dep_id
            self.professor = Professor.create(params[:professor])
            self.save
        end
    end

    def create_and_add_student(params, dep_id)
        if params.has_key?(:student) && !params[:student][:name].empty?
            params[:student][:department_id] = dep_id
            self.students << Student.create(params[:student]) 
        end
    end
    # ------------ end
end