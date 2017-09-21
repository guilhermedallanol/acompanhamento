class DailyActivity < ApplicationRecord
  validates :registered_on, presence: true, uniqueness: { scope: :user_id }
  validate :registered_on_past_or_present_only

  belongs_to :user

  def registered_on_past_or_present_only
    return unless registered_on.present? && registered_on > Date.today
    errors.add(:registered_on, :past_or_present_only)
  end
end
