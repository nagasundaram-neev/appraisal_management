class CreateNextImplications < ActiveRecord::Migration
  def change
    create_table :next_implications do |t|
    	t.belongs_to :implication
    	t.belongs_to :longterm_sheet 
      t.timestamps
    end
  end
end
