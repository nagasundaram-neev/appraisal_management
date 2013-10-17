# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do

	factory :dr_attr do
    name 'Initiative'
    weightage '30'
    desc 'descrioption in text format'
    measures ''
  end

  factory :invalid_dr_attr, class: KraAttr do
    name nil
    weightage '23'
    desc 'dfadsfdsafdsafdsafdsaf'
    measures ''
  end
  
end
