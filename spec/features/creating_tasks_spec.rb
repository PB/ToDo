require 'rails_helper'

feature 'Creating tasks' do
  let(:user) do
    FactoryGirl.build(:user)
  end

  scenario 'successful creating task', js: true do
    sign_up_as(user)

    create_list_with_name('Test list')
    expect(page).to have_content('List: Test list')

    create_task_with_name('Task 1')
    expect(page).to have_content('Task 1')
  end
end
