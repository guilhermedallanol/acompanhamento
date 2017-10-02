require 'rails_helper'

RSpec.describe Weight, type: :model do
  context "Validations" do
    it { is_expected.to validate_presence_of(:value) }
  end

  context "Associations" do
    it { is_expected.to belong_to(:day) }
  end
end
