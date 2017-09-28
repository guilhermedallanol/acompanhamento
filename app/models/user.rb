class User < ApplicationRecord
  include Clearance::User

  validates :email, presence: true

  with_options dependent: :destroy do
    has_many :days
    has_many :hungers
    has_many :priorities
    has_many :weights, through: :days
    has_many :perimeters, through: :days
    has_many :daily_activities, through: :days
  end
end
