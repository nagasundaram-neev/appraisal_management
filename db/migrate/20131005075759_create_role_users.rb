class CreateRoleUsers < ActiveRecord::Migration
  def change
    create_table :role_users do |t|
      t.belongs_to :user
      t.belongs_to :role
      t.belongs_to :appraisal_cycles
      t.timestamps
    end
  end
end
