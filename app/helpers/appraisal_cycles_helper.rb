module AppraisalCyclesHelper
	def progress_bar_manager(kra_sheet)
		p ".........................hello..............."
		kra_ratings=KraRating.where(:kra_sheet_id => kra_sheet.id, :rated_by => 1).count
		kra_rated=KraRating.where(:kra_sheet_id => kra_sheet.id,:rated_by => 1,:rating => nil )
		p kra_rated
	end
  def user_appraisal_cycle
    @usr_aprsl_cycles = []
    kr_sheets = current_user.kra_sheets.where("appraisee_status = (?) and appraiser_status = (?)", 1,1)
    kr_sheets.each { |x| @usr_aprsl_cycles.push(AppraisalCycle.find(x.appraisal_cycle_id)) }
    @usr_aprsl_cycles
  end

end
