require 'rails_helper'

RSpec.describe HungerDecorator do
  let(:object) do
    Hunger.new(registered_at: Time.zone.local(2012, 12, 21, 12, 21, 12))
  end

  subject { described_class.new(object) }

  describe "#registered_at" do
    it "returns formatted value" do
      expect(subject.registered_at).to eql '21/12/2012 12:21:12'
    end
  end

  describe "#classification" do
    it "returns essential classification label" do
      object.classification = :hunger
      expect(subject.classification).to eql "Fome"
    end

    it "returns desirable classification label" do
      object.classification = :desire
      expect(subject.classification).to eql "Desejo"
    end

    it "returns very desirable classification label" do
      object.classification = :crave
      expect(subject.classification).to eql "Vontade"
    end
  end
end
