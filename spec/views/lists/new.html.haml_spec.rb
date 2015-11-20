require 'rails_helper'

RSpec.describe 'lists/new', type: :view do
  before(:each) do
    @user = FactoryGirl.create(:user)
    assign(:list, List.new(
                    name: 'MyString',
                    user: @user
    ))
  end

  it 'renders new list form' do
    render

    assert_select 'form[action=?][method=?]', lists_path, 'post' do
      assert_select 'input#list_name[name=?]', 'list[name]'
    end
  end
end
