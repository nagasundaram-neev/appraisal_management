# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
	factory :kra_sheet1, class: KraSheet do
    appraisee_status 0
    appraiser_status 0
  end
  factory :kra_sheet2, class: KraSheet do
    appraisee_status 1
    appraiser_status 0
  end

end
