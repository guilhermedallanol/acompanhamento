class WeightDecorator < ApplicationDecorator
  include Destructable

  delegate_all

  def registered_on
    I18n.l object.registered_on
  end

  def value
    h.number_to_human(object.value, units: { unit: "kg"}, precision: 6 )
  end
end
