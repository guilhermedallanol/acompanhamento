require 'rails_helper'

RSpec.describe DailyActivityDecorator do
  it_behaves_like 'a decorator with destroy link', :weight
  it_behaves_like 'a decorator with registered date'

  let(:object) { DailyActivity.new }

  subject { described_class.new(object) }

  1.upto(11).each do |number|
    describe "#activity_#{number}" do
      it "returns check mark if true" do
        object.public_send("activity_#{number}=", true)

        expect(subject.public_send("activity_#{number}")).to eql "&#10004;"
      end

      it "returns cross mark if false" do
        expect(subject.public_send("activity_#{number}")).to eql "&#10006;"
      end
    end
  end
end
