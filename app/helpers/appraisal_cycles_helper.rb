module AppraisalCyclesHelper

	def progress_manager
		user=@kra_sheet_temp.appraisee
		@total_attributes=user.roles.last.kra_role_attrs.count
		@rated_attributes=KraRating.where(:kra_sheet_id => @kra_sheet_temp.id, :rated_by => 1).count
		return ((@rated_attributes)*100)/@total_attributes
	end

	def progress_user
		user=@kra_sheet_temp.appraisee
		@total_attributes=user.roles.last.kra_role_attrs.count
		@rated_attributes=KraRating.where(:kra_sheet_id => @kra_sheet_temp.id, :rated_by => 0).count
		return ((@rated_attributes)*100)/@total_attributes
	end

	def dr_progress_user
		@rated_attributes=@dr_ratings.where(:rated_by=>0).count
		@total_attributes=DrAttr.all.count
		return ((@rated_attributes)*100)/@total_attributes
	end

	def dr_progress_manager
		@rated_attributes=@dr_ratings.where(:rated_by=>1).count
		@total_attributes=DrAttr.all.count
		return ((@rated_attributes)*100)/@total_attributes
	end

	def performance_sum
	  @kra_ratings_by_manager=@kra_sheet_temp.kra_ratings.where(:rated_by => 1)
		kra_sum=0
		@kra_ratings_by_manager.each do |kra_rating|
			if kra_rating.rating !=nil
				@attr_weight = kra_rating.kra_attr.weightage
				kra_sum+=((kra_rating.rating*@attr_weight)/100)
			end
		end

		return (kra_sum*10).round(2)
	end
	
  def performance_sum_self
	  @kra_ratings_by_self=@kra_sheet_temp.kra_ratings.where(:rated_by => 0)
		@kra_attrs=KraAttr.all
		sum=0
		@kra_ratings_by_self.each do |kra_rating|
			if kra_rating.rating !=nil
				@attr_weight = kra_rating.kra_attr.weightage
				sum+=((kra_rating.rating*@attr_weight)/100)
			end
		end
		return (sum*10).round(2)
	end

  def user_kra_appraisal_cycle
    @usr_aprsl_cycles = []
    kr_sheets = current_user.kra_sheets.where("appraiser_status = (?) ", 1)
    kr_sheets.each { |x| @usr_aprsl_cycles.push(AppraisalCycle.find(x.appraisal_cycle_id)) }
    @usr_aprsl_cycles
  end

  def user_dr_appraisal_cycle
    @usr_aprsl_cycles = []
    dr_sheets = current_user.dr_sheets.where("appraiser_status = (?) ", 1)
    dr_sheets.each { |x| @usr_aprsl_cycles.push(AppraisalCycle.find(x.appraisal_cycle_id)) }
    @usr_aprsl_cycles
  end

  def dr_performance
	  @dr_ratings_by_manager=@dr_ratings.where(:rated_by => 1)		
		sum=0
		@dr_ratings_by_manager.each do |dr_rating|
			if dr_rating.rating !=nil
				@attr_weight = dr_rating.dr_attr.weightage
				sum+=((dr_rating.rating*@attr_weight)/100)
			end
		end
		return (sum*10).round(2)
	end

	def overall_sum_manager
		@kra_ratings_by_manager=@kra_sheet_temp.kra_ratings.where(:rated_by => 1)
	  @dr_sheet=@dr_sheets.where(:appraisal_cycle_id=>@kra_sheet_temp.appraisal_cycle_id).first
	  @dr_ratings_by_manager=DrRating.where(:dr_sheet_id=>@dr_sheet.id,:rated_by=>1)
		kra_sum=0
		@kra_ratings_by_manager.each do |kra_rating|
			if kra_rating.rating !=nil
				@attr_weight = kra_rating.kra_attr.weightage
				kra_sum+=((kra_rating.rating*@attr_weight)/100)
			end
		end
		dr_sum=0
		@dr_ratings_by_manager.each do |dr_rating|
			if dr_rating.rating !=nil
				@attr_weight = dr_rating.dr_attr.weightage
				p @attr_weight
				dr_sum+=((dr_rating.rating*@attr_weight)/100)
			end
		end
		return ((kra_sum*7)+(dr_sum*3)).round(2)
	end

	def overall_sum_self
		@kra_ratings_by_self=@kra_sheet_temp.kra_ratings.where(:rated_by => 0)
	  @dr_sheet=@dr_sheets.where(:appraisal_cycle_id=>@kra_sheet_temp.appraisal_cycle_id).first
	  @dr_ratings_by_self=DrRating.where(:dr_sheet_id=>@dr_sheet.id,:rated_by=>0)
		kra_sum=0
		@kra_ratings_by_self.each do |kra_rating|
			if kra_rating.rating !=nil
				@attr_weight = kra_rating.kra_attr.weightage
				kra_sum+=((kra_rating.rating*@attr_weight)/100)
			end
		end
		dr_sum=0
		@dr_ratings_by_self.each do |dr_rating|
			if dr_rating.rating !=nil
				@attr_weight = dr_rating.dr_attr.weightage
				p @attr_weight
				dr_sum+=((dr_rating.rating*@attr_weight)/100)
			end
		end
		return ((kra_sum*7)+(dr_sum*3)).round(2)
	end

end
