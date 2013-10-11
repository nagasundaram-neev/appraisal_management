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

	def performance_sum
		@kra_ratings_by_manager=KraRating.where(:kra_sheet_id => @kra_sheet_temp.id, :rated_by => 1)
		@kra_attrs=KraAttr.all
		sum=0
		@kra_ratings_by_manager.each do |kra_rating|
			if kra_rating.rating !=nil
				@attr_weight=@kra_attrs.select(:id,:weightage).where(:id=>kra_rating.kra_attr_id).first
				sum+=((kra_rating.rating*@attr_weight.weightage)/100)
			end
		end
		return (sum*10).round(2)
	end

	def performance_sum_self
		@kra_ratings_by_self=KraRating.where(:kra_sheet_id => @kra_sheet_temp.id, :rated_by => 0)
		@kra_attrs=KraAttr.all
		sum=0
		@kra_ratings_by_self.each do |kra_rating|
			if kra_rating.rating !=nil
				@attr_weight=@kra_attrs.select(:id,:weightage).where(:id=>kra_rating.kra_attr_id).first
				sum+=((kra_rating.rating*@attr_weight.weightage)/100)
			end
		end
		return (sum*10).round(2)
	end
end
