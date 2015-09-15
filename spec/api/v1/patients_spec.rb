require "rails_helper"

describe 'api/v1/patients', :type => :api do
  context 'requests /patients' do

    let(:url) { '/api/v1/patients' }

    it 'gets a patient with a specified id' do
      get "#{url}/66615.json"
      expect(last_response.status).to eq(200)
      response = JSON.parse(last_response.body)
      expect(response).not_to be_nil
      expect(response['dsPatients']).not_to be_nil
      expect(response['dsPatients']['tt_Person']).not_to be_nil
      expect(response['dsPatients']['tt_Person'].length).to eq(1)
    end

  end
end