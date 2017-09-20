class HungerDecorator < ApplicationDecorator
  include DestroyLink

  delegate_all

  def registered_at
    I18n.l object.registered_at, format: :shorter
  end

  def classification
    {
      hunger: "Fome",
      desire: "Desejo",
      crave:  "Vontade"
    }.dig(object.classification.to_sym)
  end
end
