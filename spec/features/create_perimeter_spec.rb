require "rails_helper"

feature "Creating a Perimeter" do
  scenario "successfully" do
    expect {
      sign_in

      visit new_perimeter_path

      fill_in 'Abdômen',        with: 90
      fill_in 'Braço Relaxado', with: 30
      fill_in 'Panturrilha',    with: 25
      fill_in 'Peitoral',       with: 90
      fill_in 'Quadril',        with: 75
      fill_in 'Coxa',           with: 45
      fill_in 'Cintura',        with: 65
      fill_in 'Punho',          with: 20

      click_button "Registrar"

      expect(page).to have_text("Perímetro registrado com sucesso")
      expect(current_path).to eql perimeters_path
    }.to change(Perimeter, :count).by(1)
  end

  scenario "with invalid or missing data" do
    expect {
      sign_in

      visit new_perimeter_path

      click_button "Registrar"

      expect(page).to have_text("Por favor verifique os problemas abaixo:")
      expect(page).to have_text("não pode ficar em branco")
      expect(current_path).to eql perimeters_path
    }.not_to change(Perimeter, :count)
  end
end
