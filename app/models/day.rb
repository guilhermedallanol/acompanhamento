class Day < ApplicationRecord
  validates :registered_on, presence: true, uniqueness: { scope: :user_id }
  validate :registered_on_past_or_present_only

  belongs_to :user

  with_options dependent: :destroy do
    has_one :daily_activity
    has_one :perimeter
    has_one :weight
  end

  enum status: %i{ pending restarted completed }

  def registered_on_past_or_present_only
    return unless registered_on.present? && registered_on > Date.today
    errors.add(:registered_on, :past_or_present_only)
  end
end
