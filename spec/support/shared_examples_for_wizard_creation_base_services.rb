require 'rails_helper'

shared_examples_for "a wizard creation base service" do |model_key|
  let(:data)  { Hash.new }
  let(:model) { double(:model) }
  let(:scope) { double(:scope) }

  subject { described_class.new(data, scope) }

  describe "#data" do
    it "is initialized with model data" do
      expect(subject.data).to eql data
    end
  end

  describe "#perform" do
    before do
      expect(
        scope
      ).to receive("build_#{model_key}").once.with(data).and_return(model)
    end

    it "returns success result if model was successfully saved" do
      expect(model).to receive(:save).once.and_return(true)

      result = subject.perform

      expect(result).to be_success
      expect(result._data[model_key]).to eql model
    end

    it "returns failure result if model can't be saved" do
      expect(model).to receive(:save).once.and_return(false)
      expect(model).to receive_message_chain(:errors, :full_messages) {
        [
          "Validation Error #1",
          "Validation Error #2"
        ]
      }

      result = subject.perform

      expect(result).to be_failure
      expect(result._data[model_key]).to eql model
      expect(result.details).to eql "Validation Error #1, Validation Error #2"
    end
  end
end
