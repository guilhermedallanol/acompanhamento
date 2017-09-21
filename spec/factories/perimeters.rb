FactoryGirl.define do
  factory :perimeter do
    user    nil
    abdomen 90
    arm     30
    calf    25
    chest   90
    hip     75
    thigh   45
    waist   65
    wrist   20
    registered_on Date.new(2012, 12, 21)
  end
end
