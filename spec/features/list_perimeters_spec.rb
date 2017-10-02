require 'rails_helper'

feature 'Listing Perimeters' do
  scenario 'displays persisted objects' do
    sign_in

    day = FactoryGirl.create(:day, user: @user)
    FactoryGirl.create(:perimeter, day: day)

    visit perimeters_path

    expect(current_path).to eql perimeters_path
    expect(page).to have_text I18n.t('perimeters.index.title')
    expect(page).to have_text "20 cm"
    expect(page).to have_text "30 cm"
    expect(page).to have_text "90 cm"
    expect(page).to have_text "65 cm"
    expect(page).to have_text "90 cm"
    expect(page).to have_text "75 cm"
    expect(page).to have_text "45 cm"
    expect(page).to have_text "25 cm"
  end
end
