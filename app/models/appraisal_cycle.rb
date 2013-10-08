class AppraisalCycle < ActiveRecord::Base
  validates :start_date, :end_date, :presence => true
  validate :end_after_start


  def self.find_kra_sheet_status
  	status=KraSheet.find_appraisal_cycle_id(self.id)
  end
  
 private

	def end_after_start
	  if end_date <= start_date
  	  errors.add(:end_date, "must be after the start date") 
  	end 
 	end
end
