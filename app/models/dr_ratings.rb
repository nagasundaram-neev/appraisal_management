class DrRatings < ActiveRecord::Base
  belongs_to :dr_attr
  belongs_to :dr_sheet
  validates_uniqueness_of :dr_sheet_id, scope: [:dr_attr_id, :rated_by]
	
  def find_dr_sheet_self(id) 		
		@dr_sheet=DrSheet.where(:appraisee_status => 0, :appraisee_id => id).last.id
	end

	def get_appraisee_dr_sheet(id)
	begin
		@dr_sheet=DrSheet.where(:appraisee_status => 1, :appraisee_id => id).last.id
		return @dr_sheet
	rescue NoMethodError
		return nil
	end
	end

	def find_dr_sheet_manager(id,appraisee_id) 
	  @dr_sheet=DrSheet.where(:appraiser_status => 0,:appraiser_id => id, :appraisee_id => appraisee_id).first.id
	end

end
