class User < ApplicationRecord
  include Clearance::User

  validates :email, presence: true

  with_options dependent: :destroy do
    has_many :daily_activities
    has_many :hungers
    has_many :perimeters
    has_many :weights
  end
end
