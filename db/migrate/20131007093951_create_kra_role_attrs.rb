class CreateKraRoleAttrs < ActiveRecord::Migration
  def change
    create_table :kra_role_attrs do |t|
      t.belongs_to :kra_attr
      t.belongs_to :role
      t.timestamps
    end
  end
end
