require 'rails_helper'

RSpec.describe WeightDecorator do
  let(:object) { Weight.new }

  subject { described_class.new(object) }

  describe "#registered_on" do
    it "returns formatted value" do
      object.registered_on = '2012-12-21'
      expect(subject.registered_on).to eql '21/12/2012'
    end
  end

  describe "#value" do
    it "returns formatted value" do
      object.value = 66.6
      expect(subject.value).to eql '66,6 kg'
    end
  end
end
