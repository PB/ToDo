require 'rails_helper'

feature 'Signing In User' do
  let(:user) do
    FactoryGirl.build(:user)
  end

  scenario 'successful sign in' do
    sign_up_as(user)
    click_link 'Logout', match: :first
    sign_in_as(user)

    expect(page).to have_content('Listing lists')
  end

  scenario 'unsuccessful sign up' do
    visit new_user_session_path

    fill_in 'Email', with: ''
    fill_in 'Password', with: ''
    click_button 'Submit'

    expect(page).to have_content('Log in')
  end
end
