require 'rails_helper'

RSpec.describe PriorityDecorator do
  let(:object) { Priority.new }

  subject { described_class.new(object) }

  describe "#category" do
    it "returns essential category label" do
      object.category = :essential
      expect(subject.category).to eql "Essencial"
    end

    it "returns desirable category label" do
      object.category = :desirable
      expect(subject.category).to eql "Desejável"
    end

    it "returns very desirable category label" do
      object.category = :very_desirable
      expect(subject.category).to eql "Muito Desejável"
    end
  end
end
