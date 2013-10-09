class KraSheet < ActiveRecord::Base

  belongs_to :appraisee, :foreign_key => "appraisee_id", :class_name => "User"
  belongs_to :appraiser, :foreign_key => "appraiser_id", :class_name => "User"

  has_many :kra_ratings
  

  def find_appraisee_name
  	@user=User.find(self.appraisee_id)
  	@user.first_name
  end

  def find_appraiser_name
  	@user=User.find(self.appraiser_id)
  	@user.first_name
  end

  def find_cycle
  	@appraisal_cycle=AppraisalCycle.find(self.appraisal_cycle_id)
  	@appraisal_cycle.start_date.to_s+" to " + @appraisal_cycle.end_date.to_s
  end

  def self.find_completion
    55
  end
  
end
