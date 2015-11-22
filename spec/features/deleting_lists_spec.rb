require 'rails_helper'

feature 'Deleting lists' do
  let(:user) do
    FactoryGirl.build(:user)
  end

  scenario 'successful deleting list' do
    sign_up_as(user)

    create_list_with_name('Test list')

    click_link 'Lists', match: :first
    click_link 'Destroy', match: :first

    expect(page).not_to have_content('Test list')
  end
end
