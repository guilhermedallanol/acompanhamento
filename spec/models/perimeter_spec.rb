require 'rails_helper'

RSpec.describe Perimeter, type: :model do
  context "Validations" do
    it { is_expected.to validate_presence_of(:abdomen) }
    it { is_expected.to validate_presence_of(:arm) }
    it { is_expected.to validate_presence_of(:calf) }
    it { is_expected.to validate_presence_of(:chest) }
    it { is_expected.to validate_presence_of(:hip) }
    it { is_expected.to validate_presence_of(:registered_on) }
    it { is_expected.to validate_presence_of(:thigh) }
    it { is_expected.to validate_presence_of(:waist) }
    it { is_expected.to validate_presence_of(:wrist) }
  end

  context "Associations" do
    it { is_expected.to belong_to(:user) }
  end
end
