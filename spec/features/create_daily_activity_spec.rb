require "rails_helper"

feature "Creating a Daily Activity" do
  scenario "successfully" do
    expect {
      sign_in

      visit new_daily_activity_path

      check I18n.t(:activity_1, scope: [:dictionary, :attributes])
      check I18n.t(:activity_2, scope: [:dictionary, :attributes])
      check I18n.t(:activity_3, scope: [:dictionary, :attributes])
      check I18n.t(:activity_5, scope: [:dictionary, :attributes])
      check I18n.t(:activity_8, scope: [:dictionary, :attributes])

      click_button "Registrar"

      expect(page).to have_text("Atividade Diária registrada com sucesso")
      expect(current_path).to eql daily_activities_path
    }.to change(DailyActivity, :count).by(1)
  end

  scenario "with invalid or missing data" do
    expect {
      sign_in

      visit new_daily_activity_path

      fill_in "Data de Registro", with: ""

      click_button "Registrar"

      expect(page).to have_text("Por favor verifique os problemas abaixo:")
      expect(page).to have_text("não pode ficar em branco")
      expect(current_path).to eql daily_activities_path
    }.not_to change(DailyActivity, :count)
  end
end
