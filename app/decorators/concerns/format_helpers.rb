module FormatHelpers
  def number_to_centimeters(value)
    h.number_to_human(value, units: { unit: "cm"} )
  end

  def number_to_kilogram(value)
    h.number_to_human(value, units: { unit: "kg"}, precision: 6 )
  end
end
