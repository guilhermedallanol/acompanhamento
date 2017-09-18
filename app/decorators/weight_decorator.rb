class WeightDecorator < ApplicationDecorator
  include Destructable
  include RegistrableDate

  delegate_all

  def value
    h.number_to_human(object.value, units: { unit: "kg"}, precision: 6 )
  end
end
