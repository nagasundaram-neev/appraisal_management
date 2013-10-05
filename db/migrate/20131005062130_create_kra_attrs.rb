class CreateKraAttrs < ActiveRecord::Migration
  def change
    create_table :kra_attrs do |t|
      t.string :name
      t.float :weightage
      t.text :desc
      t.text :measures

      t.timestamps
    end
  end
end
