require 'rails_helper'

RSpec.describe 'lists/show', type: :view do
  before(:each) do
    @user = FactoryGirl.create(:user)

    @list = assign(:list, List.create!(
                            name: 'Name',
                            user: @user
    ))

    @tasks = assign(:task, Task.create!(list: @list, name: 'test', status: false))
    @new_task = @list.tasks.new
  end

  it 'renders attributes in <p>' do
    render
    expect(rendered).to match(/Name/)
  end
end
