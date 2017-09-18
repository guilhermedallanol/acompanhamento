class WeightDecorator < ApplicationDecorator
  include DestroyLink
  include RegisteredDate

  delegate_all

  def value
    number_to_kilogram(object.value)
  end
end
