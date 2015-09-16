require "rails_helper"

describe 'api/v1/bloodselections', :type => :api do
  context 'requests bloodselections/patients' do

    let(:url) { '/api/v1/bloodselections/patients' }

    it 'returns the list of patients having blood selections' do
      get "#{url}.json"
      expect(last_response.status).to eq(200)
      response = JSON.parse(last_response.body)
      expect(response).not_to be_nil
      expect(response['dsPatients']).not_to be_nil
      expect(response['dsPatients']['tt_Person']).not_to be_nil
      expect(response['dsPatients']['tt_Person'].length).to eq(5)
    end

  end

  context 'requests patients/:patient_id/bloodselections' do
    let(:url) { '/api/v1/patients/12/bloodselections' }

    it 'returns the blood selections of patient with object id 12' do
      get "#{url}.json"
      expect(last_response.status).to eq(200)
      response = JSON.parse(last_response.body)
      expect(response).not_to be_nil
      expect(response['dsBloodselections']).not_to be_nil
      expect(response['dsBloodselections']['tt_BloodSelection']).not_to be_nil
      expect(response['dsBloodselections']['tt_BloodSelection'].length).to eq(4)
    end
  end
end