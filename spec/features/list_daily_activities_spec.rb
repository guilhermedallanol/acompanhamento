require 'rails_helper'

feature 'Listing Daily Activities' do
  scenario 'displays persisted objects' do
    sign_in

    day = FactoryGirl.create(:day, user: @user)
    FactoryGirl.create(:daily_activity, day: day)

    visit daily_activities_path

    expect(current_path).to eql daily_activities_path
    expect(page).to have_text I18n.t('daily_activities.index.title')
  end
end
