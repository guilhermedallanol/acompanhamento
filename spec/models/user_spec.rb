require 'rails_helper'

RSpec.describe User, type: :model do
  context "Validations" do
    it { is_expected.to validate_presence_of(:email) }
  end

  context "Associations" do
    it { is_expected.to have_many(:days) }
    it { is_expected.to have_many(:hungers) }
    it { is_expected.to have_many(:priorities) }
  end
end
