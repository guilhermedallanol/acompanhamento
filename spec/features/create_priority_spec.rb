require "rails_helper"

feature "Creating a Priority" do
  scenario "successfully" do
    expect {
      sign_in

      visit new_priority_path

      select  'Essencial'
      fill_in 'Prioridade', with: "Trabalhar"

      click_button "Registrar"

      expect(page).to have_text("Registro de Prioridade criado com sucesso")
      expect(current_path).to eql priorities_path
    }.to change(Priority, :count).by(1)
  end

  scenario "with invalid or missing data" do
    expect {
      sign_in

      visit new_priority_path

      click_button "Registrar"

      expect(page).to have_text("Por favor verifique os problemas abaixo:")
      expect(page).to have_text("não pode ficar em branco")
      expect(current_path).to eql priorities_path
    }.not_to change(Priority, :count)
  end
end
