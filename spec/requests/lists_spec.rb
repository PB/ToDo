require 'rails_helper'

RSpec.describe 'Lists', type: :request do
  describe 'GET /lists' do
    it 'works! (now write some real specs)' do
      get lists_path
      expect(response).to have_http_status(302)
    end
  end
end
