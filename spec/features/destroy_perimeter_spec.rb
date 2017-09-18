require 'rails_helper'

feature 'Deleting a perimeter' do
  background { sign_in }

  given!(:perimeter) do
    FactoryGirl.create(:perimeter, user: @user)
  end

  scenario 'Successfully removed' do
    visit perimeters_path

    click_link 'Excluir'

    expect(current_path).to eql perimeters_path
    expect(page).to have_text('Registro de perímetro removido com sucesso')
  end
end
