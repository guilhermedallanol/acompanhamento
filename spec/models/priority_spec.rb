require 'rails_helper'

RSpec.describe Priority, type: :model do
  context "Validation" do
    it { is_expected.to validate_presence_of(:name) }
  end

  context "Associations" do
    it { is_expected.to belong_to(:user) }
  end

  describe "#category" do
    it "returns category enum" do
      is_expected.to define_enum_for(:category).with(
        [:essential, :desirable, :very_desirable]
      )
    end
  end
end
