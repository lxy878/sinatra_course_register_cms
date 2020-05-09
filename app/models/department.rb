class Department < ActiveRecord::Base
    has_secure_password
    has_many :students
    has_many :professors
    has_many :courses

    def slug
        self.name.gsub(' ', '-').downcase
    end

    def self.find_by_slug(slug)
        self.all.find {|obj| obj.slug == slug}
    end
end