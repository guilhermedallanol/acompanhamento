require 'rails_helper'

feature 'Deleting a weight' do
  background { sign_in }

  given!(:weight) do
    FactoryGirl.create(:weight, user: @user)
  end

  scenario 'Successfully removed' do
    visit weights_path

    click_link 'Excluir'

    expect(current_path).to eql weights_path
    expect(page).to have_text('Registro de peso removido com sucesso')
  end
end
