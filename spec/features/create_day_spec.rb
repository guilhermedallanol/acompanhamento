require "rails_helper"

feature "Creating a Day" do
  scenario "successfully" do
    expect {
      sign_in

      visit new_day_path

      click_button "Registrar"

      expect(page).to have_text("Dia registrado com sucesso")
      expect(current_path).to eql new_daily_activity_path(Day.last)
    }.to change(Day, :count).by(1)
  end

  scenario "with invalid or missing data" do
    expect {
      sign_in

      visit new_day_path

      fill_in "Data do Registro", with: ""

      click_button "Registrar"

      expect(page).to have_text("Por favor verifique os problemas abaixo:")
      expect(page).to have_text("não pode ficar em branco")
      expect(current_path).to eql days_path
    }.not_to change(Day, :count)
  end

  scenario "successfully with daily activity" do
    sign_in

    visit new_day_path

    click_button "Registrar"

    expect {
      check I18n.t(:activity_1, scope: [:dictionary, :attributes])
      check I18n.t(:activity_2, scope: [:dictionary, :attributes])
      check I18n.t(:activity_3, scope: [:dictionary, :attributes])
      check I18n.t(:activity_5, scope: [:dictionary, :attributes])
      check I18n.t(:activity_8, scope: [:dictionary, :attributes])

      click_button "Registrar"

      expect(page).to have_text("Atividade Diária registrada com sucesso")
      expect(current_path).to eql new_weight_path(Day.last)
    }.to change(DailyActivity, :count).by(1)
  end

  scenario "successfully with daily activity and weight" do
    sign_in

    visit new_day_path

    click_button "Registrar"

    check I18n.t(:activity_1, scope: [:dictionary, :attributes])
    check I18n.t(:activity_2, scope: [:dictionary, :attributes])
    check I18n.t(:activity_3, scope: [:dictionary, :attributes])
    check I18n.t(:activity_5, scope: [:dictionary, :attributes])
    check I18n.t(:activity_8, scope: [:dictionary, :attributes])

    click_button "Registrar"

    expect {
      fill_in "Peso", with: ""

      click_button "Registrar"

      expect(page).to have_text("Por favor verifique os problemas abaixo:")
      expect(page).to have_text("não pode ficar em branco")

      fill_in "Peso", with: "90"

      click_button "Registrar"

      expect(page).to have_text("Peso registrado com sucesso")
      expect(current_path).to eql new_perimeter_path(Day.last)
    }.to change(Weight, :count).by(1)
  end

  scenario "successfully with daily activity, weight and perimeter" do
    sign_in

    visit new_day_path

    click_button "Registrar"

    check I18n.t(:activity_1, scope: [:dictionary, :attributes])
    check I18n.t(:activity_2, scope: [:dictionary, :attributes])
    check I18n.t(:activity_3, scope: [:dictionary, :attributes])
    check I18n.t(:activity_5, scope: [:dictionary, :attributes])
    check I18n.t(:activity_8, scope: [:dictionary, :attributes])

    click_button "Registrar"

    fill_in "Peso", with: "90"

    click_button "Registrar"

    expect {
      click_button "Registrar"

      expect(page).to have_text("Por favor verifique os problemas abaixo:")
      expect(page).to have_text("não pode ficar em branco")

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
      expect(current_path).to eql root_path
    }.to change(Perimeter, :count).by(1)
  end
end
