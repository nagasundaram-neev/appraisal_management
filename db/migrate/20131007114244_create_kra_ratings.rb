class CreateKraRatings < ActiveRecord::Migration
  def change
    create_table :kra_ratings do |t|
    	t.belongs_to :kra_sheet
    	t.belongs_to :kra_attr
    	t.float :rating
    	t.text :comment
    	t.boolean :rated_by
      t.timestamps
    end
  end
end
