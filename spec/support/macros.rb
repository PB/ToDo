def sign_in_as(user)
  visit new_user_session_path

  fill_in 'Email', with: user.email
  fill_in 'Password', with: user.password
  click_button 'Submit'
end

def sign_up_as(user)
  visit new_user_registration_path

  fill_in 'Email', with: user.email
  fill_in 'Password', with: user.password
  fill_in 'Password confirmation', with: user.password
  click_button 'Sign up'
end

def create_list_with_name(name)
  click_link 'Lists', match: :first
  click_link 'add'

  expect(page).to have_content('New list')

  fill_in 'Name', with: name
  click_button 'Save'
end

def create_task_with_name(name)
  fill_in 'Name', with: name
  click_button 'Add'
  wait_for_ajax
end
