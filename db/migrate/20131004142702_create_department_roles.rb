class CreateDepartmentRoles < ActiveRecord::Migration
  def change
    create_table :department_roles do |t|
      t.belongs_to :role
      t.belongs_to :department

      t.timestamps
    end
  end
end
