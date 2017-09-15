require 'rails_helper'

RSpec.describe WeightDecorator do
  let(:object) { Weight.new }
  let(:helper) { double(:helper) }

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

  describe "#destroy_link" do
    it "returns destroy link" do
      allow(subject).to receive(:h).once.and_return(helper)

      expect(helper).to receive(:link_to).once.with(
        'Excluir',
        object,
        method: :delete,
        data: { confirm: 'Você tem certeza que deseja excluir esse registro?' }
      )

      subject.destroy_link
    end
  end
end
