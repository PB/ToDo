require 'rails_helper'

RSpec.describe 'lists/index', type: :view do
  before(:each) do
    @user = FactoryGirl.create(:user)
    assign(:lists, [
      List.create!(
        name: 'Name',
        user: @user
      ),
      List.create!(
        name: 'Name',
        user: @user
      )
    ])
  end

  it 'renders a list of lists' do
    render
    assert_select 'tr>td', text: 'Name'.to_s, count: 2
  end
end
