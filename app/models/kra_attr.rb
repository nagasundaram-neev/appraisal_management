class KraAttr < ActiveRecord::Base

  validates :name, presence: true, uniqueness: true
  validates :weightage, presence: true, :inclusion => 1..99
  validates :desc, presence:true
  has_many :kra_role_attrs, dependent: :destroy
   
  def name_and_weightage
    "#{self.name}: #{self.weightage} %"
  end
end
