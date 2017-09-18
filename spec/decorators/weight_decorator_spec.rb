require 'rails_helper'

RSpec.describe WeightDecorator do
  it_behaves_like 'a decorator with destroy link', :weight
  it_behaves_like 'a decorator with registered date'

  let(:object) { Weight.new }
  let(:helper) { double(:helper) }

  subject { described_class.new(object) }

  describe "#value" do
    it "returns formatted value" do
      object.value = 66.6
      expect(subject.value).to eql '66,6 kg'
    end
  end
end
