class CreateDepartmentRoles < ActiveRecord::Migration
  def change
    create_table :department_roles do |t|
      t.integer :department_id
      t.integer :role_id

      t.timestamps
    end
  end
end
