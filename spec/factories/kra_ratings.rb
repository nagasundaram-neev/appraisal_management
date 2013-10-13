# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :kra_rating do
  	kra_sheet_id 1
  	kra_attr_id 2
  	rating 8
  	comment "keep it up"
  	rated_by 0
  end

   factory :kra_rating_by_manager, class: KraRating do
  	kra_sheet_id 1
  	kra_attr_id 2
  	rating 8
  	comment "keep it up"
  	rated_by 1
  end
end
