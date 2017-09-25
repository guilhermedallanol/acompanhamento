require 'rails_helper'

feature 'Deleting a Daily Activity' do
  background { sign_in }

  given!(:daily_activity) do
    FactoryGirl.create(:daily_activity, user: @user)
  end

  scenario 'Successfully removed' do
    visit daily_activities_path

    click_link 'Excluir'

    expect(current_path).to eql daily_activities_path
    expect(page).to have_text('Registro de Atividade Diária removido com sucesso')
  end
end
