require 'rails_helper'

RSpec.describe DailyActivity, type: :model do
  context "Associations" do
    it { is_expected.to belong_to(:day) }
  end
end
