class KraRating < ActiveRecord::Base
  belongs_to :kra_attr
  belongs_to :kra_sheet

  validates_uniqueness_of :kra_sheet_id, scope: [:kra_attr_id, :rated_by]

  include KraRatingsHelper
	
	def find_current_user_role(id)
		@role=RoleUser.find_by_user_id(id)
		@role
	end
	def find_kra_attrs_for_role(id)
	  @kra_attrs=[]
		for i in KraRoleAttr.find_all_by_role_id(find_current_user_role(id).role_id).to_a do
			@kra_attrs.push(KraAttr.find(i.kra_attr_id))
		end
		@kra_attrs
	end

	def find_kra_sheet_self(id) 		
		@kra_sheet=KraSheet.where(:appraisee_status => 0, :appraisee_id => id).last.id
		
	end

	def find_kra_sheet_manager(id,appraisee_id) 
	  p current_user.kra_sheet
		@kra_sheet=KraSheet.where(:appraiser_status => 0,:appraiser_id => id, :appraisee_id => appraisee_id).first.id
	end
	

end
