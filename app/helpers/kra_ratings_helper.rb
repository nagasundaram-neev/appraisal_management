module KraRatingsHelper
	
  def kr_attr_rating_obj(kr_sheet_id, kr_attr_id, rated_by)
    begin
      @kr_atr_rating_obj =   KraRating.where(:kra_sheet_id => kr_sheet_id, :kra_attr_id => kr_attr_id, :rated_by => rated_by).first
      return  @kr_atr_rating_obj
    rescue NoMethodError
      return nil
    end
  end

  def find_appraisee_details(kr_sheet_id)

  	 @appraisee=User.where(:id => KraSheet.select(:appraisee_id).where(:id => kr_sheet_id).last.appraisee_id).last
  	return @appraisee
  end

  def find_kra_sheet_details(id)
  	return KraSheet.where(:id => id).last
  end
  
end
