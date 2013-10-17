module DrRatingsHelper

	def dr_attr_rating_obj(dr_sheet_id, dr_attr_id, rated_by)
    begin
      @dr_atr_rating_obj =   DrRating.where(:dr_sheet_id => dr_sheet_id, :dr_attr_id => dr_attr_id, :rated_by => rated_by).first
      return  @dr_atr_rating_obj
    rescue NoMethodError
      return nil
    end
  end



	 def find_dr_sheet_details(id)
    return DrSheet.where(:id => id).last
  end
end
