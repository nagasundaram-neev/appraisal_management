class CreateDrSheets < ActiveRecord::Migration
  def change
    create_table :dr_sheets do |t|
    	t.belongs_to :appraisal_cycle
    	t.belongs_to :appraisee, :foreign_key => 'appraisee_id', :class_name => "User"
  		t.belongs_to :appraiser, :foreign_key => 'appraiser_id', :class_name => "User"
  		t.boolean :appraisee_status,:default => false
  		t.boolean :appraiser_status, :default => false
      t.timestamps
    end
  end
end
