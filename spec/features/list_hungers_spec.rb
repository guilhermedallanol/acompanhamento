require 'rails_helper'

feature 'Listing Hungers' do
  scenario 'displays persisted objects' do
    sign_in

    FactoryGirl.create(:hunger, user: @user)

    visit hungers_path

    expect(current_path).to eql hungers_path
    expect(page).to have_text I18n.t('hungers.index.title')
    expect(page).to have_text "Trabalho"
    expect(page).to have_text "Anseio de comer um doce"
    expect(page).to have_text "Faz mais de 2h que comi uma refeição?"
    expect(page).to have_text "Vontade"
  end
end
