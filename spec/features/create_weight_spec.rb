require "rails_helper"

feature "Creating a Weight" do
  scenario "successfully" do
    expect {
      sign_in

      visit new_weight_path

      fill_in "Data de Registro", with: "21/12/2012"
      fill_in "Peso", with: "90"

      click_button "Criar Peso"

      expect(page).to have_text("Peso registrado com sucesso")
      expect(current_path).to eql weights_path
    }.to change(Weight, :count).by(1)
  end

  scenario "wigh invalid or missing data" do
    expect {
      sign_in

      visit new_weight_path

      fill_in "Data de Registro", with: ""

      click_button "Criar Peso"

      expect(page).to have_text("Por favor verifique os problemas abaixo:")
      expect(page).to have_text("não pode ficar em branco")
      expect(current_path).to eql weights_path
    }.not_to change(Weight, :count)
  end
end
