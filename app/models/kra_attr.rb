class KraAttr < ActiveRecord::Base
  validates :name, presence: true
  validates :weightage, presence: true, :inclusion => 1..99
  validates :desc, presence:true
end
