class CreateDepartmentUsers < ActiveRecord::Migration
  def change
    create_table :department_users do |t|
      t.belongs_to :user
      t.belongs_to :department
      t.date  :start_date
      t.date  :end_date

      t.timestamps
    end
  end
end
