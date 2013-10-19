class Implication < ActiveRecord::Base
 	has_many :current_implications, :foreign_key => "current_implication_id", :class_name => "DevImplication"
  has_many :next_implication, :foreign_key => "next_implication_id", :class_name => "DevImplication"
end
