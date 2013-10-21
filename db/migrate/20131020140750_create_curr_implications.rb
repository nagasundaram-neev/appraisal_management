class CreateCurrImplications < ActiveRecord::Migration
  def change
    create_table :curr_implications do |t|
    	t.belongs_to :implication
    	t.belongs_to :longterm_sheet 
      t.timestamps
    end
  end
end
