class PerimeterDecorator < ApplicationDecorator
  include RegistrableDate

  delegate_all

  def abdomen
    number_to_centimeters(object.abdomen)
  end

  def arm
    number_to_centimeters(object.arm)
  end

  def calf
    number_to_centimeters(object.calf)
  end

  def chest
    number_to_centimeters(object.chest)
  end

  def hip
    number_to_centimeters(object.hip)
  end

  def thigh
    number_to_centimeters(object.thigh)
  end

  def waist
    number_to_centimeters(object.waist)
  end

  def wrist
    number_to_centimeters(object.wrist)
  end
end
