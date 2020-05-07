class CreateCourses < ActiveRecord::Migration[6.0]
  def change
    create_table :courses do |t|
      t.string :name
      t.integer :dep_id
      t.integer :prof_id
    end
  end
end
