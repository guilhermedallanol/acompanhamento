require 'rails_helper'

feature 'Deleting a hunger' do
  background { sign_in }

  given!(:hunger) do
    FactoryGirl.create(:hunger, user: @user)
  end

  scenario 'Successfully removed' do
    visit hungers_path

    click_link 'Excluir'

    expect(current_path).to eql hungers_path
    expect(page).to have_text('Registro de Fome removido com sucesso')
  end
end
