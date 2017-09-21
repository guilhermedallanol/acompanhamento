require "rails_helper"

feature "Creating a Hunger" do
  scenario "successfully" do
    expect {
      sign_in

      visit new_hunger_path

      fill_in 'Data e Hora de Registro', with: Time.now
      fill_in 'Local', with: "Trabalho"
      fill_in 'Sensações', with: "Vontade na boca de comer um doce"
      fill_in 'Pergunta-Chave', with: "Faz mais de 2h que comi uma refeição?"
      select  'Vontade'

      click_button "Registrar"

      expect(page).to have_text("Registro de Fome criado com sucesso")
      expect(current_path).to eql hungers_path
    }.to change(Hunger, :count).by(1)
  end

  scenario "with invalid or missing data" do
    expect {
      sign_in

      visit new_hunger_path

      click_button "Registrar"

      expect(page).to have_text("Por favor verifique os problemas abaixo:")
      expect(page).to have_text("não pode ficar em branco")
      expect(current_path).to eql hungers_path
    }.not_to change(Hunger, :count)
  end
end
