class DailyActivityDecorator < ApplicationDecorator
  include RegisteredDate

  delegate_all

  def activity_1
    boolean_to_html(object.activity_1)
  end

  def activity_2
    boolean_to_html(object.activity_2)
  end

  def activity_3
    boolean_to_html(object.activity_3)
  end

  def activity_4
    boolean_to_html(object.activity_4)
  end

  def activity_5
    boolean_to_html(object.activity_5)
  end

  def activity_6
    boolean_to_html(object.activity_6)
  end

  def activity_7
    boolean_to_html(object.activity_7)
  end

  def activity_8
    boolean_to_html(object.activity_8)
  end

  def activity_9
    boolean_to_html(object.activity_9)
  end

  def activity_10
    boolean_to_html(object.activity_10)
  end

  def activity_11
    boolean_to_html(object.activity_11)
  end
end
