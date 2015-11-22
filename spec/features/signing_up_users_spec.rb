require 'rails_helper'

feature 'Signing Up User' do
  let(:user) do
    FactoryGirl.build(:user)
  end

  scenario 'successful sign up' do
    sign_up_as(user)

    expect(page).to have_content('Listing lists')
  end

  scenario 'unsuccessful sign up' do
    visit new_user_registration_path

    fill_in 'Email', with: ''
    fill_in 'Password', with: ''
    fill_in 'Password confirmation', with: ''
    click_button 'Sign up'

    expect(page).to have_content('Sign up')
  end
end
