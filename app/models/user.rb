class User < ApplicationRecord
  include Clearance::User

  validates :email, presence: true

  with_options dependent: :destroy do
    has_many :perimeters
    has_many :weights
    has_many :hungers
  end
end
