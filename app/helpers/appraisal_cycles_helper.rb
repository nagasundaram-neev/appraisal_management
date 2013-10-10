module AppraisalCyclesHelper

	def progress_manager
		@total_attributes=KraRating.where(:kra_sheet_id => @kra_sheet_temp.id, :rated_by => 1).count
		@empty_attributes=KraRating.where(:kra_sheet_id => @kra_sheet_temp.id,:rating=>nil, :rated_by => 1).count
		return ((@total_attributes-@empty_attributes)*100)/@total_attributes
	end

	def progress_user
		@total_attributes=KraRating.where(:kra_sheet_id => @kra_sheet_temp.id, :rated_by => 0).count
		@empty_attributes=KraRating.where(:kra_sheet_id => @kra_sheet_temp.id,:rating=>nil, :rated_by => 0).count
		return ((@total_attributes-@empty_attributes)*100)/@total_attributes
	end

	def performance_sum_user
		sum=0

		@kra_ratings_by_self_array=KraRating.where(:kra_sheet_id => @kra_sheet_temp.id, :rated_by => 0).select(:rating).map(&:rating)
		@kra_ratings_by_self_array.each do |x| 
			if x==nil
				x=0
			end  
				sum+= x  
			end
		return sum*0.7
	end

	def performance_sum_manager
		sum=0
		@kra_ratings_by_self_array=KraRating.where(:kra_sheet_id => @kra_sheet_temp.id, :rated_by => 1).select(:rating).map(&:rating)
		@kra_ratings_by_self_array.each do |x|
			if x==nil
				x=0
			end  
		 	sum+= x
		 end
		return sum*0.3
	end


end
