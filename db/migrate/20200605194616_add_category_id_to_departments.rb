class AddCategoryIdToDepartments < ActiveRecord::Migration[6.0]
  def change
    add_column :departments, :category_id, :string
  end
end
