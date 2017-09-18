class WeightDecorator < ApplicationDecorator
  include Destructable
  include RegistrableDate

  delegate_all

  def value
    number_to_kilogram(object.value)
  end
end
