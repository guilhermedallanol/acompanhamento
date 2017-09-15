require 'rails_helper'

feature 'Listing Weights' do
  scenario 'displays persisted objects' do
    sign_in

    FactoryGirl.create(:weight, value: 90, user: @user)

    visit weights_path

    expect(current_path).to eql weights_path
    expect(page).to have_text I18n.t('weights.index.title')
    expect(page).to have_text "90 kg"
  end
end
