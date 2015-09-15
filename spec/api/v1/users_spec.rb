require "rails_helper"

describe 'api/v1/users', :type => :api do
  context 'requests users' do

    let(:url) { '/api/v1/users' }

    it 'json query without LoginName query parameter' do
      get "#{url}.json"
      expect(last_response.status).to eq(401)
      expect(last_response.body).to eq("Error")
    end

    it 'json query with LoginName query parameter' do
      get "#{url}.json", :LoginName => 'bar'
      expect(last_response.status).to eq(200)
      expect(last_response.body).not_to be_nil
      response = JSON.parse(last_response.body)
      expect(response).not_to be_nil
      expect(response['dsUsers']).not_to be_nil
      expect(response['dsUsers']['tt_User']).not_to be_nil
      expect(response['dsUsers']['tt_User'].length).to eq(1)
    end

  end
end