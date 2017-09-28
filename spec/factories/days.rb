FactoryGirl.define do
  factory :day do
    user nil
    registered_on Date.new(2012, 12, 21)
    weight nil
    perimeter nil
    daily_activity nil
    status 1
  end
end
