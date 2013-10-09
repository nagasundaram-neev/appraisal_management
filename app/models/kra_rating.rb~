class KraRating < ActiveRecord::Base
	belongs_to :kra_attr
	belongs_to :kra_sheet
	include KraRatingsHelper
	
	def find_current_user_role(id)
		@role=RoleUser.find_by_user_id(id)
		@role
	end
	def find_kra_attrs_for_role(id)
	  p "//////////////"
	  p id
		@kra_attrs=[]
		for i in KraRoleAttr.find_all_by_role_id(find_current_user_role(id).role_id).to_a do
			@kra_attrs.push(KraAttr.find(i.kra_attr_id))
		end
		@kra_attrs
	end

	def find_kra_sheet_self(id)
		@kra_sheet=KraSheet.where(:appraisal_cycle_id =>find_current_user_role(id).appraisal_cycles_id , :appraisee_id => id).all[0].id
	end

	def find_kra_sheet_manager(id) 
	  p current_user.kra_sheet
		@kra_sheet=KraSheet.where(:appraisal_cycle_id => find_current_user_role(id).appraisal_cycles_id, :appraiser_id => id).all[0].id
	end
end
