class KraRating < ActiveRecord::Base
	belongs_to :kra_attr
	belongs_to :kra_sheet
end
