class CreatePlanSheets < ActiveRecord::Migration
  def change
    create_table :plan_sheets do |t|
    	t.belongs_to :longterm_sheet
    	t.text :agreed_goal
    	t.text :way_to_achieve
    	t.text :resources_required
    	t.text :measure
      t.timestamps
    end
  end
end
