class AppraisalCycle < ActiveRecord::Base
  has_many :kra_sheets
  validates :start_date, :end_date, :presence => true, :uniqueness => true
  validate :end_after_start
  def self.find_rating
    @ratings=KraRatings.where(:kra_sheet_id => self.id)
  end

  def create_kra_sheets
    User.where("role != 'admin'").each do |user|
      appraiser_id = nil
      unless user.kra_sheets.last.nil?
        appraiser_id = user.kra_sheets.last.appraiser_id
      end
        user.kra_sheets.build(:appraiser_id => appraiser_id , :appraisal_cycle_id => self.id,:appraisee_status => 0, :appraiser_status => 0).save
        p "@@@@@@saved@@@@@@@@222"
    end
    p "---------------------kra sheets created--------------"
  end

  private

  def end_after_start
    if end_date <= start_date
      errors.add(:end_date, "must be after the start date") 
    end
  end

end
