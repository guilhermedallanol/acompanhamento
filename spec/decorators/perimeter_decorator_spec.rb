require 'rails_helper'

RSpec.describe PerimeterDecorator do
  it_behaves_like 'a decorator with destroy link', :perimeter
  it_behaves_like 'a decorator with registered date'

  let(:object) { Perimeter.new }
  let(:helper) { double(:helper) }

  subject { described_class.new(object) }

  describe "#abdomen" do
    it "returns formatted abdomen" do
      object.abdomen = 66
      expect(subject.abdomen).to eql '66 cm'
    end
  end

  describe "#arm" do
    it "returns formatted arm" do
      object.arm = 66
      expect(subject.arm).to eql '66 cm'
    end
  end

  describe "#calf" do
    it "returns formatted calf" do
      object.calf = 66
      expect(subject.calf).to eql '66 cm'
    end
  end

  describe "#chest" do
    it "returns formatted chest" do
      object.chest = 66
      expect(subject.chest).to eql '66 cm'
    end
  end

  describe "#hip" do
    it "returns formatted hip" do
      object.hip = 66
      expect(subject.hip).to eql '66 cm'
    end
  end

  describe "#thigh" do
    it "returns formatted thigh" do
      object.thigh = 66
      expect(subject.thigh).to eql '66 cm'
    end
  end

  describe "#waist" do
    it "returns formatted waist" do
      object.waist = 66
      expect(subject.waist).to eql '66 cm'
    end
  end

  describe "#wrist" do
    it "returns formatted wrist" do
      object.wrist = 66
      expect(subject.wrist).to eql '66 cm'
    end
  end
end
