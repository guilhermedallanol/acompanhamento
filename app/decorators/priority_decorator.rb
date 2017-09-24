class PriorityDecorator < ApplicationDecorator
  include DestroyLink

  delegate_all

  def category
    I18n.t(object.category, scope: [:priority, :enums, :category])
  end
end
