require 'rails_helper'

feature 'Listing Priorities' do
  scenario 'displays persisted objects' do
    sign_in

    FactoryGirl.create(:priority, user: @user)

    visit priorities_path

    expect(current_path).to eql priorities_path
    expect(page).to have_text I18n.t('priorities.index.title')
  end
end
