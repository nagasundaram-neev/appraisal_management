class CurrImplication < ActiveRecord::Base
	belongs_to :implication
	belongs_to :longterm_sheet
end
