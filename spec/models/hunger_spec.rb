require 'rails_helper'

RSpec.describe Hunger, type: :model do
  context "Validations" do
    it { is_expected.to validate_presence_of(:registered_at) }
    it { is_expected.to validate_presence_of(:local) }
    it { is_expected.to validate_presence_of(:sensation) }
    it { is_expected.to validate_presence_of(:question) }
  end

  context "Associations" do
    it { is_expected.to belong_to(:user) }
  end

  describe "#type" do
    it "returns type enum" do
      is_expected.to define_enum_for(:type).with(
        [:hunger, :desire, :disposal]
      )
    end
  end
end
