module AppraisalCyclesHelper

	def progress_manager
		user=User.find(@kra_sheet_temp.appraisee_id)
		@total_attributes=user.roles.last.kra_role_attrs.count
		@empty_attributes=KraRating.where(:kra_sheet_id => @kra_sheet_temp.id,:rating=>nil, :rated_by => 1).count
		if ((@total_attributes-@empty_attributes)==0) 
			return 100 
		else
			return ((@total_attributes-@empty_attributes)*100)/@total_attributes
	  end
	end

	def progress_user
		user=User.find(@kra_sheet_temp.appraisee_id)
		@total_attributes=user.roles.last.kra_role_attrs.count
		@empty_attributes=KraRating.where(:kra_sheet_id => @kra_sheet_temp.id,:rating=>nil, :rated_by => 0).count
		if ((@total_attributes-@empty_attributes)==0) 
			return 100 
		else
			return ((@total_attributes-@empty_attributes)*100)/@total_attributes
	  end
	end

	def performance_sum
	  @kra_ratings_by_manager=@kra_sheet_temp.kra_ratings.where(:rated_by => 1)
		
		
		sum=0
		@kra_ratings_by_manager.each do |kra_rating|
			if kra_rating.rating !=nil
				#@attr_weight = @kra_attrs.select(:id,:weightage).where(:id=>kra_rating.kra_attr_id).first
				@attr_weight = kra_rating.kra_attr.weightage
				sum+=((kra_rating.rating*@attr_weight)/100)
			end
		end
		return (sum*10).round(2)
	end
	
  def performance_sum_self
	  @kra_ratings_by_self=@kra_sheet_temp.kra_ratings.where(:rated_by => 0)
		#@kra_ratings_by_self=KraRating.where(:kra_sheet_id => @kra_sheet_temp.id, :rated_by => 0)
		@kra_attrs=KraAttr.all
		sum=0
		@kra_ratings_by_self.each do |kra_rating|
			if kra_rating.rating !=nil
				#@attr_weight=@kra_attrs.select(:id,:weightage).where(:id=>kra_rating.kra_attr_id).first
				@attr_weight = kra_rating.kra_attr.weightage
				sum+=((kra_rating.rating*@attr_weight)/100)
			end
		end
		return (sum*10).round(2)
	end
  def user_appraisal_cycle
    @usr_aprsl_cycles = []
    kr_sheets = current_user.kra_sheets.where("appraisee_status = (?) ", 1)
    kr_sheets.each { |x| @usr_aprsl_cycles.push(AppraisalCycle.find(x.appraisal_cycle_id)) }
    @usr_aprsl_cycles
  end

end
