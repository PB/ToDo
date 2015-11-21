require 'rails_helper'

RSpec.describe 'Lists', type: :request do
  describe 'GET /lists' do
    it 'works! (now write some real specs)' do
      get lists_path
      expect(response).to have_http_status(302)
    end
  end

  describe 'GET /public-view' do
    it 'should return public view of list' do
      list = FactoryGirl.create(:list, user: FactoryGirl.create(:user))
      get public_view_path(list.slug)
      expect(response).to have_http_status(200)
    end
  end
end
