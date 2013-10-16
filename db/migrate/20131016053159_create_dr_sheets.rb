class CreateDrSheets < ActiveRecord::Migration
  def change
    create_table :dr_sheets do |t|
    	t.belongs_to :appraisal_cycle
    	t.belongs_to :dr_appraisee, :foreign_key => 'dr_appraisee_id', :class_name => "User"
  		t.belongs_to :dr_appraiser, :foreign_key => 'dr_appraiser_id', :class_name => "User"
  		t.boolean :appraisee_status,:default => false
  		t.boolean :appraiser_status, :default => false
      t.timestamps
    end
  end
end
