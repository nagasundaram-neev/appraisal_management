class DevImplication < ActiveRecord::Base
	belongs_to :current_implication, :foreign_key => "current_implication_id", :class_name => "Implication" 
	belongs_to :next_implication, :foreign_key => "next_implication_id", :class_name => "Implication"
	belongs_to :longterm_sheet 
end
