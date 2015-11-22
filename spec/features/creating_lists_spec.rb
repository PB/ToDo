require 'rails_helper'

feature 'Creating lists' do
  let(:user) do
    FactoryGirl.build(:user)
  end

  scenario 'successful creating list' do
    sign_up_as(user)

    create_list_with_name('Test list')
    expect(page).to have_content('List: Test list')
  end
end
