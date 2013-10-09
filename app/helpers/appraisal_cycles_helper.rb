module AppraisalCyclesHelper
	def progress_bar_manager(kra_sheet)
		p ".........................hello..............."
		kra_ratings=KraRating.where(:kra_sheet_id => kra_sheet.id, :rated_by => 1).count
		kra_rated=KraRating.where(:kra_sheet_id => kra_sheet.id,:rated_by => 1,:rating => nil )
		p kra_rated
	end
end
