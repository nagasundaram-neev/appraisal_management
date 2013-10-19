class CreateLongtermGoals < ActiveRecord::Migration
  def change
    create_table :longterm_goals do |t|
    	t.belongs_to :longterm_sheet
    	t.text :prof_goal
    	t.text :personal_goal
    	t.text :tech_strength
    	t.text :non_tech_strength	
    	t.text :tech_imp
    	t.text :non_tech_imp
    	t.text :appraiser_comment
      t.timestamps
    end
  end
end
