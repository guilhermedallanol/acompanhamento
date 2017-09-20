require 'rails_helper'

RSpec.describe HungerDecorator do
  let(:object) do
    double(:object, registered_at: DateTime.new(2012, 12, 21, 12, 21, 12))
  end

  subject { described_class.new(object) }

  describe "#registered_at" do
    it "returns formatted value" do
      expect(subject.registered_at).to eql '21/12/2012 12:21:12'
    end
  end
end
