FactoryGirl.define do
  factory :perimeter do
    user    nil
    wrist   20
    arm     30
    chest   90
    waist   65
    abdomen 90
    hip     75
    thigh   45
    calf    25
    registered_on Date.new(2012, 12, 21)
  end
end
