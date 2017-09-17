require 'rails_helper'

shared_examples_for "a creation base service" do |model_key|
  let(:scope_key)  { model_key.to_s.pluralize.to_sym }
  let(:data)       { Hash.new }
  let(:scope)      { double(:scope) }
  let(:model)      { double(:model) }
  let(:collection) { double(:collection) }

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
      ).to receive(scope_key).once.and_return(collection)

      expect(
        collection
      ).to receive(:new).once.with(data).and_return(model)
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
