class CreateDevImplications < ActiveRecord::Migration
  def change
    create_table :dev_implications do |t|
    	t.belongs_to :longterm_sheet
    	t.belongs_to :current_implication, :foreign_key => 'current_implication_id', :class_name => "Implication"
  		t.belongs_to :next_implication, :foreign_key => 'next_implication_id', :class_name => "Implication"
      t.timestamps
    end
  end
end 