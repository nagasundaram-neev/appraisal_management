class LongtermSheet < ActiveRecord::Base
	belongs_to :appraisee, :foreign_key => "appraisee_id", :class_name => "User"
  belongs_to :appraiser, :foreign_key => "appraiser_id", :class_name => "User"
  belongs_to :appraisal_cycle
  has_many :longterm_goals
  has_many :plan_sheets
  has_many :current_implications, through: :dev_implications, :source => :implication
  has_many :next_implications, through:  :dev_implications, :source => :implication
  has_many :dev_implications
  validates_uniqueness_of :appraisee_id, scope: [:appraisal_cycle_id]


  def find_appraisee_name
  	@user=User.find(self.appraisee_id)
  	@user.first_name
  end

  def find_appraiser_name
  	unless self.appraiser.nil?
    @user=self.appraiser
    @user.first_name
  else
    "No appraiser assigned"
    end
  end
end
