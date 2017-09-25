require 'rails_helper'

feature 'Deleting a Priority' do
  background { sign_in }

  given!(:priority) do
    FactoryGirl.create(:priority, user: @user)
  end

  scenario 'Successfully removed' do
    visit priorities_path

    click_link 'Excluir'

    expect(current_path).to eql priorities_path
    expect(page).to have_text('Registro de Prioridade removido com sucesso')
  end
end
