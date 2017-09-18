require 'rails_helper'

shared_examples_for "a decorator with registered date" do
  let(:object) { double(:object, registered_on: Date.new(2012, 12, 21)) }

  subject { described_class.new(object) }

  describe "#registered_on" do
    it "returns formatted value" do
      expect(subject.registered_on).to eql '21/12/2012'
    end
  end
end
