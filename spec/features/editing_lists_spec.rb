require 'rails_helper'

feature 'Editing lists' do
  let(:user) do
    FactoryGirl.build(:user)
  end

  scenario 'successful editing list' do
    sign_up_as(user)

    create_list_with_name('Test list')

    click_link 'Lists', match: :first
    click_link 'Edit', match: :first
    expect(page).to have_content('Editing list')
    fill_in 'Name', with: 'New name'
    click_button 'Save'

    expect(page).to have_content('List: New name')
  end
end
