require 'rails_helper'

shared_examples_for "a decorator with destroy link" do |model|
  let(:object) { model.to_s.classify.constantize.new }
  let(:helper) { double(:helper) }

  subject { described_class.new(object) }

  describe "#destroy_link" do
    it "returns destroy link" do
      allow(subject).to receive(:h).once.and_return(helper)

      expect(helper).to receive(:link_to).once.with(
        'Excluir',
        object,
        method: :delete,
        data: {
          confirm: I18n.t(
            :confirm_deletion,
            scope: object.model_name.i18n_key,
            default: :confirm_deletion
          )
        }
      )

      subject.destroy_link
    end
  end
end
