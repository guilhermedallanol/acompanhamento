require 'rails_helper'

RSpec.describe Hunger, type: :model do
  context "Validations" do
    it { is_expected.to validate_presence_of(:local) }
    it { is_expected.to validate_presence_of(:question) }
    it { is_expected.to validate_presence_of(:registered_at) }
    it { is_expected.to validate_presence_of(:sensation) }
  end

  context "Associations" do
    it { is_expected.to belong_to(:user) }
  end

  describe "#classification" do
    it "returns classification enum" do
      is_expected.to define_enum_for(:classification).with(
        [:hunger, :desire, :crave]
      )
    end
  end
end
