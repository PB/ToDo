require 'rails_helper'

RSpec.describe 'lists/show', type: :view do
  before(:each) do
    @user = FactoryGirl.create(:user)

    @list = assign(:list, List.create!(
                            name: 'Name',
                            user: @user
    ))
  end

  it 'renders attributes in <p>' do
    render
    expect(rendered).to match(/Name/)
  end
end
