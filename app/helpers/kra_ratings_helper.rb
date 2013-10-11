module KraRatingsHelper
	def find_current_user
		current_user.id
	end

  def kr_attr_rating(kr_sheet_id, kr_attr_id, rated_by)
    begin
      @kr_atr_rating =   KraRating.select("rating").where(:kra_sheet_id => kr_sheet_id, :kra_attr_id => kr_attr_id, :rated_by => rated_by).first.rating
      return  @kr_atr_rating
    rescue NoMethodError
      return nil
    end

  end

  def kr_attr_comment(kr_sheet_id, kr_attr_id, rated_by)
    begin
    @kr_atr_comment = KraRating.select("comment").where(:kra_sheet_id => kr_sheet_id, :kra_attr_id => kr_attr_id, :rated_by => rated_by).first.comment
    return @kr_atr_comment
    rescue NoMethodError
      return nil
    end
  end
end
