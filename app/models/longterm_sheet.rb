class LongtermSheet < ActiveRecord::Base
	belongs_to :appraisee, :foreign_key => "appraisee_id", :class_name => "User"
  belongs_to :appraiser, :foreign_key => "appraiser_id", :class_name => "User"
  belongs_to :appraisal_cycle
  has_many :longterm_goals
  has_many :plan_sheets
  has_many :dev_implications
  validates_uniqueness_of :appraisee_id, scope: [:appraisal_cycle_id]
end
