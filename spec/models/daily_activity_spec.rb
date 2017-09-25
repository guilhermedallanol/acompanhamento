require 'rails_helper'

RSpec.describe DailyActivity, type: :model do
  context "Validation" do
    it { is_expected.to validate_presence_of(:registered_on) }
    it { is_expected.to validate_uniqueness_of(:registered_on).scoped_to(:user_id) }
  end

  context "Associations" do
    it { is_expected.to belong_to(:user) }
  end

  context "Custom Validations" do
    describe "#past_or_present_only" do
      it "is invalid if future date" do
        subject.registered_on = Date.today + 1.day

        subject.valid?

        expect(subject.errors).to have_key(:registered_on)
        expect(
          subject.errors.full_messages.to_s
        ).to include I18n.t(
          :past_or_present_only, scope: [:activerecord, :errors, :messages]
        )
      end

      it "is valid if present date" do
        subject.registered_on = Date.today

        subject.valid?

        expect(subject.errors).not_to have_key(:registered_on)
      end

      it "is valid if present date" do
        subject.registered_on = Date.today - 1.day

        subject.valid?

        expect(subject.errors).not_to have_key(:registered_on)
      end
    end
  end
end
