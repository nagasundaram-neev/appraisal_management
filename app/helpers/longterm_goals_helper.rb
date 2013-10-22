module LongtermGoalsHelper
	def find_longterm_sheet_self(id) 		
		@longterm_sheet=LongtermSheet.where(:appraisee_status => false, :appraisee_id => id).last.id
	end

end
