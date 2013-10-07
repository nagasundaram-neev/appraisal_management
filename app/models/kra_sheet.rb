class KraSheet < ActiveRecord::Base

  belongs_to :appraisee, :foreign_key => "appraisee_id", :class_name => "User"
  belongs_to :appraiser, :foreign_key => "appraiser_id", :class_name => "User"

  has_many :kra_ratings
  
end
