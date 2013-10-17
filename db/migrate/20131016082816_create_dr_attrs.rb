class CreateDrAttrs < ActiveRecord::Migration
  def change
    create_table :dr_attrs do |t|
    	t.string :name
      t.float :weightage
      t.text :desc
      t.timestamps
    end
  end
end
