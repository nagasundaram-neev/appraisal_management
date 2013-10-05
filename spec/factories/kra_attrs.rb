# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :kra_attr do
    name 'Drive project effectiveness'
    weightage '30'
    desc 'descrioption in text format'
    measures ''
  end

  factory :invalid_kra_attr, class: KraAttr do
    name nil
    weightage '23'
    desc 'dfadsfdsafdsafdsafdsaf'
    measures ''
  end
end
