class CreateDrRatings < ActiveRecord::Migration
  def change
    create_table :dr_ratings do |t|
    	t.belongs_to :dr_sheet
    	t.belongs_to :dr_attr
    	t.float :rating
    	t.text :comment
    	t.boolean :rated_by
      t.timestamps
    end
  end
end
