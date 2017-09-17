require 'rails_helper'

RSpec.describe Weight, type: :model do
  context "Validations" do
    it { is_expected.to validate_presence_of(:value) }
    it { is_expected.to validate_presence_of(:registered_on) }
  end

  context "Associations" do
    it { is_expected.to belong_to(:user) }
  end
end
